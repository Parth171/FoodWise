import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({Key? key}) : super(key: key);

  @override
  _HomePageCopyWidgetState createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget> {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CurrentListRecord>>(
      future: queryCurrentListRecordOnce(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0x783EB489),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF20D3F1),
                  ),
                ),
              ),
            ),
          );
        }
        List<CurrentListRecord> homePageCopyCurrentListRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0x783EB489),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'My Current List',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Lato',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: StreamBuilder<List<CurrentListRecord>>(
                            stream: queryCurrentListRecord(
                              queryBuilder: (currentListRecord) =>
                                  currentListRecord.where('foodLife',
                                      isLessThan: 0),
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
                              List<CurrentListRecord>
                                  listViewCurrentListRecordList =
                                  snapshot.data!;
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCurrentListRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCurrentListRecord =
                                      listViewCurrentListRecordList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 5.0, 15.0, 0.0),
                                    child: Container(
                                      width: 90.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0178FF),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: StreamBuilder<
                                          List<CurrentListRecord>>(
                                        stream: queryCurrentListRecord(
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    Color(0xFF20D3F1),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<CurrentListRecord>
                                              listTileCurrentListRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final listTileCurrentListRecord =
                                              listTileCurrentListRecordList
                                                      .isNotEmpty
                                                  ? listTileCurrentListRecordList
                                                      .first
                                                  : null;
                                          return Slidable(
                                            endActionPane: ActionPane(
                                              motion: const ScrollMotion(),
                                              extentRatio: 0.5,
                                              children: [
                                                StreamBuilder<
                                                    List<InventoryStockRecord>>(
                                                  stream:
                                                      queryInventoryStockRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0xFF20D3F1),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<InventoryStockRecord>
                                                        slidableActionWidgetInventoryStockRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final slidableActionWidgetInventoryStockRecord =
                                                        slidableActionWidgetInventoryStockRecordList
                                                                .isNotEmpty
                                                            ? slidableActionWidgetInventoryStockRecordList
                                                                .first
                                                            : null;
                                                    return SlidableAction(
                                                      label: 'Bought',
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      icon: Icons.add_task,
                                                      onPressed: (_) async {
                                                        if (listViewCurrentListRecord
                                                            .hasItemName()) {
                                                          await listViewCurrentListRecord
                                                              .reference
                                                              .delete();
                                                        } else {
                                                          return;
                                                        }

                                                        await InventoryStockRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createInventoryStockRecordData(
                                                              itemType:
                                                                  listViewCurrentListRecord
                                                                      .itemType,
                                                              itemName:
                                                                  listViewCurrentListRecord
                                                                      .itemName,
                                                              itemDate:
                                                                  getCurrentTimestamp,
                                                              foodLife:
                                                                  listViewCurrentListRecord
                                                                      .foodLife,
                                                            ));
                                                      },
                                                    );
                                                  },
                                                ),
                                                StreamBuilder<
                                                    List<CurrentListRecord>>(
                                                  stream:
                                                      queryCurrentListRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color(0xFF20D3F1),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CurrentListRecord>
                                                        slidableActionWidgetCurrentListRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final slidableActionWidgetCurrentListRecord =
                                                        slidableActionWidgetCurrentListRecordList
                                                                .isNotEmpty
                                                            ? slidableActionWidgetCurrentListRecordList
                                                                .first
                                                            : null;
                                                    return SlidableAction(
                                                      label: 'Delete',
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      icon: Icons.delete,
                                                      onPressed: (_) async {
                                                        await listViewCurrentListRecord
                                                            .reference
                                                            .delete();
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              title: Text(
                                                listViewCurrentListRecord
                                                    .itemName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                              ),
                                              subtitle: Text(
                                                listViewCurrentListRecord
                                                    .itemType,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                              ),
                                              trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                              tileColor: Color(0xFF0178FF),
                                              dense: false,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).accent2,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 50.0,
                      fillColor: FlutterFlowTheme.of(context).tertiary,
                      icon: Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('AddItem');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
