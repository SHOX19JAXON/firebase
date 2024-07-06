
import 'package:firebase/vazifa/cubits/country/country.dart';
import 'package:firebase/vazifa/cubits/country/country_state.dart';
import 'package:firebase/vazifa/data/models/country/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.4),
        centerTitle: false,
        title: Text(
          "Davlatlar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: BlocBuilder<CountryCubit, CountryState>(
          builder: (BuildContext context, state) {
        if (state.myStatus == MyStatus.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        if (state.myStatus == MyStatus.error) {
          return Center(child: Text(state.errorText));
        }

        return ListView.builder(
          itemCount: state.countries.length,
          itemBuilder: (context, index) {
            CountryModel countryModel = state.countries[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Colors.white.withOpacity(0.5),
                  )
                ),
                child: ListTile(
                  title: Text(
                    countryModel.name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                  ),
                  trailing: Text(
                    countryModel.emoji,
                    style: TextStyle(
                      fontSize: 30.sp,
                        // color: Colors.white.withOpacity(0.5)
                    ),
                  ),
                  subtitle: Text("Code ${countryModel.code}",style: TextStyle(
                    // fontSize: 30.sp,
                    color: Colors.white.withOpacity(0.5)
                  ),),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
