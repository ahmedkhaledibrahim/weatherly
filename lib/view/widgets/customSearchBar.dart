import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherly/bloc/search_cubit.dart';
import 'package:weatherly/view/screens/searchResluts_screen.dart';

import '../../models/city.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Iterable<String> searchList = [];
  String searchWord = '';
  TextEditingController cityController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  static const List<String> _fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];

  Future<void> _handleSearch(String value) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      if (value.isNotEmpty) {
        await BlocProvider.of<SearchCubit>(context).searchCity(value);
        assignSearchList();
      }
    });
  }

  void assignSearchList() {
    searchList = BlocProvider.of<SearchCubit>(context)
        .searchList
        .map((e) => "${e.name}, ${e.country}");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 8, 0),
            child: Autocomplete<String>(
              fieldViewBuilder: (context, textEditingController, focusNode,
                      onFieldSubmitted) =>
                  TextFormField(
                controller: textEditingController,
                obscureText: false,

                focusNode: focusNode,
                onTap: onFieldSubmitted,
                onChanged: (value) async {
                  searchWord = value;
                  await _handleSearch(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search City',
                  labelStyle: FlutterFlowTheme.of(context).titleSmall,
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).alternate,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                style: FlutterFlowTheme.of(context).labelMedium,
              ),
              optionsBuilder: (TextEditingValue fruitTextEditingValue) {
                // if user is input nothing
                if (fruitTextEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                // if user is input something the build
                // suggestion based on the user input
                return searchList;
              },

              // when user click on the suggested
              // item this function calls
              onSelected: (String value) {
                debugPrint('You just selected $value');
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
          child: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: 10,
            borderWidth: 2,
            buttonSize: 45,
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultsWidget(
                        searchList:
                            BlocProvider.of<SearchCubit>(context).searchList,
                        searchWord: searchWord),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
