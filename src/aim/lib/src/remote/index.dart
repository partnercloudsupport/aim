import 'dart:core';

import 'rpc.dart';
import '../models.dart';


var RpcGetMainIndexes = AlmRpc.get(path: '/index/main', parser: ModelMainIndexes.parse);
var RpcGetIndexQuotes = AlmRpc.get(path: '/index/quote', parser: ModelIndexQuotes.parse);
