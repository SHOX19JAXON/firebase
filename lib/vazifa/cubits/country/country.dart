
import 'package:firebase/vazifa/cubits/country/country_state.dart';
import 'package:firebase/vazifa/data/models/my_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_provider/api_provider.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit()
      : super(CountryState(
            myStatus: MyStatus.loading, countries: [], errorText: ''));

  Future<void> callCountry() async {
    MyResponse myResponse = await ApiProvider.callAllCountry();
    if (myResponse.errorText.isEmpty) {
      emit(state.copyWith(countries: myResponse.data, myStatus: MyStatus.ok));
    } else {
      emit(state.copyWith(
          myStatus: MyStatus.error, errorText: myResponse.errorText));
    }
  }
}
