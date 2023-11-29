import 'package:flutter/material.dart';

class ModuleCardWidget extends StatefulWidget {
  const ModuleCardWidget(
      {super.key,
      required this.label,
      required this.image,
      required this.onTap,
    });

  final String label;
  final String image;
  final VoidCallback onTap;

  @override
  State<ModuleCardWidget> createState() => _ModuleCardWidgetState();
}

class _ModuleCardWidgetState extends State<ModuleCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Align(
        alignment: const AlignmentDirectional(0.00, 0.00),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            //color: FlutterFlowTheme.of(context).secondaryBackground,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    widget.image,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Text(widget.label,
                    style: const TextStyle(
                      fontFamily: 'Open Sans',
                      color: Color(0xFFFF6537),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
