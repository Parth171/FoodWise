import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'inventory_page_copy_model.dart';
export 'inventory_page_copy_model.dart';

class InventoryPageCopyWidget extends StatefulWidget {
  const InventoryPageCopyWidget({Key? key}) : super(key: key);

  @override
  _InventoryPageCopyWidgetState createState() =>
      _InventoryPageCopyWidgetState();
}

class _InventoryPageCopyWidgetState extends State<InventoryPageCopyWidget> {
  late InventoryPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InventoryPageCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<InventoryStockRecord>>(
      stream: queryInventoryStockRecord(
        singleRecord: true,
      ),
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
        List<InventoryStockRecord> inventoryPageCopyInventoryStockRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final inventoryPageCopyInventoryStockRecord =
            inventoryPageCopyInventoryStockRecordList.isNotEmpty
                ? inventoryPageCopyInventoryStockRecordList.first
                : null;
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
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 30.0),
                      child: Text(
                        'My Inventory',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<List<InventoryStockRecord>>(
                      stream: queryInventoryStockRecord(
                        queryBuilder: (inventoryStockRecord) =>
                            inventoryStockRecord.where('foodLife',
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
                        List<InventoryStockRecord>
                            gridViewInventoryStockRecordList = snapshot.data!;
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: gridViewInventoryStockRecordList.length,
                          itemBuilder: (context, gridViewIndex) {
                            final gridViewInventoryStockRecord =
                                gridViewInventoryStockRecordList[gridViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (functions
                                          .inventoryCheck(
                                              gridViewInventoryStockRecord
                                                  .itemDate,
                                              gridViewInventoryStockRecord
                                                  .foodLife)
                                          .toString() ==
                                      '0') {
                                    await gridViewInventoryStockRecord.reference
                                        .delete();
                                  } else {
                                    return;
                                  }

                                  await InventoryStockRecord.collection
                                      .doc()
                                      .set(createInventoryStockRecordData(
                                        itemType: gridViewInventoryStockRecord
                                            .itemType,
                                        itemName: gridViewInventoryStockRecord
                                            .itemName,
                                        itemDate: getCurrentTimestamp,
                                        foodLife: gridViewInventoryStockRecord
                                            .foodLife,
                                      ));
                                },
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0178FF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      85.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await gridViewInventoryStockRecord
                                                      .reference
                                                      .delete();
                                                },
                                                child: Icon(
                                                  Icons.delete_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 7.0, 0.0, 0.0),
                                          child: Text(
                                            gridViewInventoryStockRecord
                                                .itemName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 7.0, 0.0, 0.0),
                                          child: Text(
                                            functions
                                                .inventoryCheck(
                                                    gridViewInventoryStockRecord
                                                        .itemDate,
                                                    gridViewInventoryStockRecord
                                                        .foodLife)
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0),
                                        child: Text(
                                          'days left',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
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
          ),
        );
      },
    );
  }
}
