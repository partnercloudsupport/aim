import 'dart:core';

import 'rpc.dart';
import '../models.dart';


var RpcGetNewsCategories = AlmRpc.get(path: '/news/categories', parser: ModelNewsCategories.parse);
var RpcGetNewsItems = AlmRpc.get(path: '/news/list', parser: ModelNewsItems.parse);
var RpcGetNewsDetail = AlmRpc.get(path: '/news/detail', parser: ModelNewsDetail.parse);
