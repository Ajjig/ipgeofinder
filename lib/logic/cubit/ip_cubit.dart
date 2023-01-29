import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/ip_repository.dart';
import '../../data/models/ip_data_model.dart';
import 'package:equatable/equatable.dart';
part 'ip_state.dart';

class IpCubit extends Cubit<IpState> {
  IpCubit() : super(IpInit());

  bool isValidIp(String ip) {
    final ipRegex = RegExp(r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$',
        caseSensitive: false, multiLine: false);
    return ipRegex.hasMatch(ip);
  }

  void fetchIpData(String ip) async {
    if (!isValidIp(ip)) {
      emit(IpInvalid());
      return;
    } else if (state is IpLoaded) {
      if ((state as IpLoaded).ip == ip) {
        return;
      }
    }
    try {
      emit(IpLoading());
      final data = await IpRepository.fetchIpData(ip);
      emit(IpLoaded(data));
    } catch (e) {
      emit(IpUnexpectedError());
    }
  }
}
