<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>

<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="/Moderna/js/datepicker.min.js"></script>
<script type="text/javascript" src="/Moderna/js/datepicker.en.js"></script>
<link
   href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
   rel="stylesheet">

<link href="/css/datepicker.min.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
#loading {
 width: 100%;  
 height: 100%;  
 top: 0px;
 left: 0px;
 position: fixed;  
 display: block;  
 opacity: 0.7;  
 background-color: #fff;  
 z-index: 99;  
 text-align: center; } 
  
#loading-image {  
 position: absolute;  
 top: 50%;  
 left: 50%; 
 z-index: 100; }

.panel-default>.panel-heading {
   color: #333;
   background-color: #68a4c4;
   border-color: #ddd;
}

a {
   color: #ffffff;
   text-decoration: none;
}

#holder {
   background: #eeeeee;
}

#holder {
   overflow: hidden;
}

.node {
   cursor: pointer;
   stroke: #3182bd;
   stroke-width: 1.5px;
}

.link {
   fill: none;
   stroke: #9ecae1;
   stroke-width: 1.5px;
}

input[type=checkbox].css-checkbox {
   position: absolute;
   z-index: -1000;
   left: -1000px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   height: 1px;
   width: 1px;
   margin: -1px;
   padding: 0;
   border: 0;
}

input[type=checkbox].css-checkbox+label.css-label {
   padding-left: 25px;
   height: 20px;
   display: inline-block;
   line-height: 20px;
   background-repeat: no-repeat;
   background-position: 0 0;
   vertical-align: middle;
   cursor: pointer;
}

input[type=checkbox].css-checkbox:checked+label.css-label {
   background-position: 0 -20px;
}

label.css-label {
   background-image:
      url(http://csscheckbox.com/checkboxes/u/csscheckbox_5ed3110c2dbfa898cff4fe25b69ceb41.png);
   -webkit-touch-callout: none;
   -webkit-user-select: none;
   -khtml-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
}
.inputWithIcon input[type=text]{
padding-left:40px;
}
.inputWithIcon{
position:relative;
}
.inputWithIcon i{
    position: absolute;
    left: 20px;
    /* top: 13px; */
    padding: 9px 8px;
    color: #aaa;
    transition: .3s;
  }

.inputWithIcon input[type=text]:focus +i{
color: #68a4c4;
}

</style>

<script type="text/javascript">
   // �޷� ��¥ �ѱ���� ��ȯ��Ŵ!
   $.fn.datepicker.language['en'] = {
      dateFormat : 'yyyy/mm/dd',
      firstDay : 0,
      today : '���� ��¥',
      clear : '�ݱ�',
      months : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��',
            '11��', '12��' ],
      monthsShort : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��',
            '10��', '11��', '12��' ],
      daysMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
      daysShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
      daysMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
   };
</script>
</head>

<body>
   <!-- container -->
   <div class="container ng-scope">

      <!-- sns�˻� ū ���� -->
      <div class="page-header">
         <h2>SNS�м�</h2>
      </div>

      <div class="panel panel-default">
         <div class="panel-heading">
            <!-- ��(1��) -->
            <ul class="nav">
               <li class="on active" style="display: inline-block;"><a> </a></li>

            </ul>
         </div>

         <div class="panel-body">

            <div class="col-lg-5"></div>
            <div class="col-lg-4 inputWithIcon">
                <input
                  type="text" placeholder="��) â��" id="input_keyword">
               <i class="fa fa-search fa-lg fa-fw" aria-hidden="true"></i>
            </div>


            <p class="clearfix"></p>
            <!-- ���� ������ -->

            <form class="form-inline text-center">

               <ul class="snslist" style="display: inline-block;">

                  <li style="display: inline-block;"><input type="checkbox"
                     class="css-checkbox" id="checkall" value="all"><label
                     for="checkall" class="css-label">��ü</label></li>

                  <li style="display: inline-block;"><input type="checkbox"
                     class="css-checkbox" value="news" id="checknews" name="checktg"><label
                     for="checknews" class="css-label">����</label></li>

                  <li style="display: inline-block;"><input type="checkbox"
                     class="css-checkbox" value="blog" id="checkblog" name="checktg"><label
                     for="checkblog" class="css-label">���α�</label></li>

               </ul>

               <!-- �޷³��� �κ� -->
               <input type="text" readonly data-range="true"
                  data-multiple-dates-separator=" - " data-language="en"
                  class="datepicker-here" id="datefromto" />

               <div class="btn-group date_pick">
                  <a onclick="day();" id="day" class="btn btn-default">1��</a> <a
                     onclick="week();" id="week" class="btn btn-default">1��</a> <a
                     onclick="month();" id="month" class="btn btn-default">1����</a> <input
                     type="hidden" id="timeunit" value="" />
               </div>

               <a class="btn btn-primary" id="recognition_search"
                  onclick="callAjax()">��ȸ</a>

            </form>
         </div>
      </div>

      <div class="row">
         <h3>��޷� ����</h3>
         <div id="holder" class="col-md-11"></div>

      </div>

      <div class="row">
         <h3>��޷� ����</h3>
         <div class="col-md-11">
            <table class="table table-striped table-hover">
               <thead id="ttlRank">
               </thead>

               <tbody id="rank">
               </tbody>
            </table>
         </div>
      </div>
   </div>
<div id="loading"><img id="loading-image" src="/images/loading.svg" alt="Loading..." /></div>
</body>
<script>
   ////////////////////////////////////////////////////////////////////
   var init = function(selector, root) {
      $(selector).html(" ");

      var width = 1000, height = 1000, root;

      var tick = function() {
         link.attr("x1", function(d) {
            return d.source.x;
         }).attr("y1", function(d) {
            return d.source.y;
         }).attr("x2", function(d) {
            return d.target.x;
         }).attr("y2", function(d) {
            return d.target.y;
         });

         node.attr("cx", function(d) {
            return d.x;
         }).attr("cy", function(d) {
            return d.y;
         });

         labels.attr("x", function(d) {
            return d.x;
         }).attr("y", function(d) {
            return d.y;
         });
      }

      var force = d3.layout.force().size([ width, height ]).linkDistance(100)
            .charge(-520).on("tick", tick);

      var svg = d3.select(selector).append("svg").attr("width", width).attr(
            "height", height);

      var link = svg.selectAll(".link"), node = svg.selectAll(".node"), labels = svg
            .selectAll(".labels");

      var update = function() {
         var nodes = flatten(root), links = d3.layout.tree().links(nodes);

         // Restart the force layout.
         force.nodes(nodes).links(links).start();

         // Update the links��
         link = link.data(links, function(d) {
            return d.target.id;
         });

         // Exit any old links.
         link.exit().remove();

         // Enter any new links.
         link.enter().insert("line", ".node").attr("class", "link").attr(
               "x1", function(d) {
                  return d.source.x;
               }).attr("y1", function(d) {
            return d.source.y;
         }).attr("x2", function(d) {
            return d.target.x;
         }).attr("y2", function(d) {
            return d.target.y;
         });

         // Update the nodes��
         node = node.data(nodes, function(d) {
            return d.id;
         }).style("fill", color); // ��� ����

         // Exit any old nodes.
         node.exit().remove();

         // Enter any new nodes.
         node.enter().append("circle").attr("class", "node").attr("cx",
               function(d) {
                  return d.x;
               }).attr("cy", function(d) {
            return d.y;
         }).attr("r", function(d) {
            return Math.sqrt(d.size) / 10 || 4.5;
         }).style("fill", color).on("click", click).call(force.drag);

         labels = labels.data(nodes, function(d) {
            return d.id;
         })

         // Exit any old labels.
         labels.exit().remove();

         labels.enter().append("text").attr("class", "labels").attr("x",
               function(d) {
                  return d.x;
               }).attr("y", function(d) {
            return d.y;
         }).attr("dx", 9).attr("dy", ".31em").text(function(d) {
            return d.name;
         }).style("fill-opacity", function(d) {
            var opacity = 1;
            if (d.name === "parentnode") {
               opacity = 0;
            }

            return opacity;
         })
      }

      // Color leaf nodes orange, and packages white or blue.
      var color = function(d) {
         return d._children ? "ea4335" : d.children ? "fbbc05" : "4285f4";
      }

      // Toggle children on click.
      var click = function(d) {
         if (!d3.event.defaultPrevented) {
            if (d.children) {
               d._children = d.children;
               d.children = null;
            } else {
               d.children = d._children;
               d._children = null;
            }
            update();
         }
      }

      // Returns a list of all nodes under the root.
      var flatten = function(root) {
         var nodes = [], i = 0;

         var recurse = function(node) {
            if (node.children)
               node.children.forEach(recurse);
            if (!node.id)
               node.id = ++i;
            nodes.push(node);
         }

         recurse(root);
         return nodes;
      }
      update();
   }; // init �Լ� ������ �κ�

   function day() {
      document.getElementById("timeunit").value = 'day';
   }
   function week() {
      document.getElementById("timeunit").value = 'week';
   }
   function month() {
      document.getElementById("timeunit").value = 'month';
   }

   function callAjax() {

      var key = "6682823005424844847";

      var arrayParam = []; //�迭 �ʱ�ȭ
      if ($("input:checkbox[name=checktg]:checked").val() != null) {
         $("input:checkbox[name=checktg]:checked").each(function() {
            arrayParam.push($(this).val());
         });
      } else {
         swal("Ÿ���� ������ �ּ���.", "��ü, ����, ���α� �� �������ּ���.");
      }

      var keyword = "";
      if ($("#input_keyword").val() != "") {
         keyword = $("#input_keyword").val();
      } else {
         swal("Ű���带 �Է��� �ּ���.", "ex) â��, �һ����, ������ ��...");
      }
      var string = "";
      if ($("#datefromto").val() != "") {
         string = $("#datefromto").val();
      } else {
         swal("��¥�� ������ �ּ���.", "ex) 10/1 ~ 10/18");
      }
      var strArray = string.split(' - ');
      var firstArray = strArray[0].split('/');
      var toArray = strArray[1].split('/');

      var from = firstArray[0] + firstArray[1] + firstArray[2];
      var to = toArray[0] + toArray[1] + toArray[2];
      var timeunit = $("#timeunit").val();

      var parentInfo = new Object();
      var childArray = new Array();
      parentInfo.name = "parentnode"; //1
      parentInfo.size = 15000;
      $
            .ajax({
               url : "http://api.datamixi.com/datamixiApi/topictrend?key="
                     + key + "&target=" + arrayParam + "&keyword="
                     + keyword + "&from=" + from + "&to=" + to
                     + "&timeunit=" + timeunit,
               async : false,
               success : function(data) {
                  for (var i = 0; i < data.return_object.trends.length; i++) {
                     var childchildArray = new Array();
                     var childInfo = new Object();
                     childInfo.name = data.return_object.trends[i].fromDate;
                     childInfo.size = 80000;

                     for (j = 1; j < data.return_object.trends[i].nodes.length; j++) { //nodes�迭(16) x trends�迭(2) ���̸�ŭ ȸ�� 
                        console.log(data.return_object.trends[i].nodes[j].name);
                        var childchildInfo = new Object();
                        childchildInfo.name = data.return_object.trends[i].nodes[j].name;
                        childchildInfo.size = 38120;
                        childchildArray.push(childchildInfo); //�ڽĹ迭�� ���� �� 16���� ������ ����
                     }

                     childInfo.children = childchildArray;
                     childArray.push(childInfo);
                  }
                  parentInfo.children = childArray; //2
                  console.log(parentInfo);
                  init("#holder", parentInfo);

                  /////////////////////////////////
                  console.log(data.return_object);
                  var rankTableTtl = '<tr>';
                  for (var i = 0; i < 3; i++) {
                     if(data.return_object.trends[i] !== undefined){
                        rankTableTtl += '<th colspan=\"2\" scope=\"rowgroup\">'+data.return_object.trends[i].fromDate+'</th>';
                     }else{
                        break;
                     }
                  }
                  rankTableTtl += '</tr>';
                  
                  rankTableTtl += "<tr>";
                  for (var j = 0; j < 3; j++) {
                     if(data.return_object.trends[j] !== undefined){
                        rankTableTtl+='<th>����</th><th>�˻���</th>';
                     }else{
                        break;
                     }
                     
                  }
                  rankTableTtl += "</tr>";
                  $("#ttlRank").html(rankTableTtl);
                  ////////////////////////////////////////////////////////////////////////////
                  
                  
                  var rankTable = '';

                  for (var i = 0; i < 10; i++) {
                     rankTable += '<tr>';
                     for (var j = 0; j < 3; j++) {
                        if (data.return_object.trends[j] === undefined) {
                           break;
                        }
                        rankTable += '<td>' + i + '</td>';
                        if (data.return_object.trends[j].nodes[i].name !== undefined) {
                           rankTable += '<td>'
                                 + data.return_object.trends[j].nodes[i].name
                                 + '</td>';
                        } else {
                           rankTable += '<td>' + '' + '</td>';
                        }
                        if (data.return_object.trends.length == 1) {
                           break;
                        }
                     }
                     rankTable += '</tr>';

                  }
                  $("#rank").html(rankTable);

               }
            });
   }

   $(document).ready(function() {
      //�ֻ�� üũ�ڽ� Ŭ��
      $("#checkall").click(function() {
         //Ŭ���Ǿ�����
         if ($("#checkall").prop("checked")) {
            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
            $("input[name=checktg]").prop("checked", true);
            //Ŭ���� �ȵ�������
         } else {
            //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ����
            $("input[name=checktg]").prop("checked", false);
         }
      })
   })
   
   $(window).load(function() {    
     $('#loading').hide();  
    });
</script>

</html>