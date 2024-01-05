import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_item_model.dart';
export 'add_item_model.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({
    Key? key,
    this.foodType,
  }) : super(key: key);

  final String? foodType;

  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  late AddItemModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddItemModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x783EB489),
      appBar: AppBar(
        backgroundColor: Color(0xFF0178FF),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Visibility(
          visible: responsiveVisibility(
            context: context,
            desktop: false,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
              child: Text(
                'Add An Item',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Lato',
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
              ),
            ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFDBE2E7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add_shopping_cart_sharp,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 50.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: TextFormField(
                  controller: _model.textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Item Name...',
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).secondary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).accent4,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).accent4,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 20.0),
                child: StreamBuilder<List<FoodTypeRecord>>(
                  stream: queryFoodTypeRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF20D3F1),
                            ),
                          ),
                        ),
                      );
                    }
                    List<FoodTypeRecord> stateFoodTypeRecordList =
                        snapshot.data!;
                    return FlutterFlowDropDown<String>(
                      controller: _model.stateValueController ??=
                          FormFieldController<String>(
                        _model.stateValue ??= 'Type',
                      ),
                      options: stateFoodTypeRecordList
                          .map((e) => e.foodType)
                          .toList(),
                      onChanged: (val) =>
                          setState(() => _model.stateValue = val),
                      width: double.infinity,
                      height: 56.0,
                      textStyle: GoogleFonts.getFont(
                        'Lato',
                        color: Color(0xFF101213),
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      hintText: 'Food Type',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xFF57636C),
                        size: 15.0,
                      ),
                      fillColor: FlutterFlowTheme.of(context).info,
                      elevation: 2.0,
                      borderColor: Color(0xFFE0E3E7),
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(20.0, 4.0, 12.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.05),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: StreamBuilder<List<FoodTypeRecord>>(
                    stream: queryFoodTypeRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFF20D3F1),
                              ),
                            ),
                          ),
                        );
                      }
                      List<FoodTypeRecord> buttonFoodTypeRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final buttonFoodTypeRecord =
                          buttonFoodTypeRecordList.isNotEmpty
                              ? buttonFoodTypeRecordList.first
                              : null;
                      return FFButtonWidget(
                        onPressed: () async {
                          if (_model.stateValue == 'Produce') {
                            await CurrentListRecord.collection
                                .doc()
                                .set(createCurrentListRecordData(
                                  itemName: _model.textController.text,
                                  itemType: _model.stateValue,
                                  itemDate: getCurrentTimestamp,
                                  foodLife: -7,
                                ));
                          } else {
                            if (_model.stateValue ==
                                'Cereal and Breakfast Foods') {
                              await CurrentListRecord.collection
                                  .doc()
                                  .set(createCurrentListRecordData(
                                    itemName: _model.textController.text,
                                    itemType: _model.stateValue,
                                    itemDate: getCurrentTimestamp,
                                    foodLife: -20,
                                  ));
                            } else {
                              if (_model.stateValue == 'Frozen Foods') {
                                await CurrentListRecord.collection
                                    .doc()
                                    .set(createCurrentListRecordData(
                                      itemName: _model.textController.text,
                                      itemType: _model.stateValue,
                                      itemDate: getCurrentTimestamp,
                                      foodLife: -30,
                                    ));
                              } else {
                                if (_model.stateValue == 'Meat/Poultry') {
                                  await CurrentListRecord.collection
                                      .doc()
                                      .set(createCurrentListRecordData(
                                        itemName: _model.textController.text,
                                        itemType: _model.stateValue,
                                        itemDate: getCurrentTimestamp,
                                        foodLife: -8,
                                      ));
                                } else {
                                  if (_model.stateValue == 'Packaged Meals') {
                                    await CurrentListRecord.collection
                                        .doc()
                                        .set(createCurrentListRecordData(
                                          itemName: _model.textController.text,
                                          itemType: _model.stateValue,
                                          itemDate: getCurrentTimestamp,
                                          foodLife: -10,
                                        ));
                                  } else {
                                    if (_model.stateValue == 'Instant Foods') {
                                      await CurrentListRecord.collection
                                          .doc()
                                          .set(createCurrentListRecordData(
                                            itemName:
                                                _model.textController.text,
                                            itemType: _model.stateValue,
                                            itemDate: getCurrentTimestamp,
                                            foodLife: -30,
                                          ));
                                    } else {
                                      if (_model.stateValue == 'Dairy') {
                                        await CurrentListRecord.collection
                                            .doc()
                                            .set(createCurrentListRecordData(
                                              itemName:
                                                  _model.textController.text,
                                              itemType: _model.stateValue,
                                              itemDate: getCurrentTimestamp,
                                              foodLife: -9,
                                            ));
                                      } else {
                                        if (_model.stateValue ==
                                            'Canned and Jarred Goods') {
                                          await CurrentListRecord.collection
                                              .doc()
                                              .set(createCurrentListRecordData(
                                                itemName:
                                                    _model.textController.text,
                                                itemType: _model.stateValue,
                                                itemDate: getCurrentTimestamp,
                                                foodLife: -30,
                                              ));
                                        } else {
                                          if (_model.stateValue == 'Snacks') {
                                            await CurrentListRecord.collection
                                                .doc()
                                                .set(
                                                    createCurrentListRecordData(
                                                  itemName: _model
                                                      .textController.text,
                                                  itemType: _model.stateValue,
                                                  itemDate: getCurrentTimestamp,
                                                  foodLife: -15,
                                                ));
                                          } else {
                                            if (_model.stateValue ==
                                                'Pasta and Rice') {
                                              await CurrentListRecord.collection
                                                  .doc()
                                                  .set(
                                                      createCurrentListRecordData(
                                                    itemName: _model
                                                        .textController.text,
                                                    itemType: _model.stateValue,
                                                    itemDate:
                                                        getCurrentTimestamp,
                                                    foodLife: -30,
                                                  ));
                                            } else {
                                              if (_model.stateValue ==
                                                  'Seafood') {
                                                await CurrentListRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createCurrentListRecordData(
                                                      itemName: _model
                                                          .textController.text,
                                                      itemType:
                                                          _model.stateValue,
                                                      itemDate:
                                                          getCurrentTimestamp,
                                                      foodLife: -20,
                                                    ));
                                              } else {
                                                if (_model.stateValue ==
                                                    'Baking') {
                                                  await CurrentListRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          createCurrentListRecordData(
                                                        itemName: _model
                                                            .textController
                                                            .text,
                                                        itemType:
                                                            _model.stateValue,
                                                        itemDate:
                                                            getCurrentTimestamp,
                                                        foodLife: -45,
                                                      ));
                                                } else {
                                                  if (_model.stateValue ==
                                                      'Grains') {
                                                    await CurrentListRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createCurrentListRecordData(
                                                          itemName: _model
                                                              .textController
                                                              .text,
                                                          itemType:
                                                              _model.stateValue,
                                                          itemDate:
                                                              getCurrentTimestamp,
                                                          foodLife: -8,
                                                        ));
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }

                          context.pushNamed('HomePageCopy');
                        },
                        text: 'Add Item',
                        options: FFButtonOptions(
                          width: 204.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
