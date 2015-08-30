// // $(document).ready(function () {
// //   $('#register').on('click', function(e){
// //     var link = $(this).attr
// //     e.preventDefault();
// //     console.log(link)
// //       // $.ajax({type: "POST", url: link).done(function(){
// //       //     $('#vote').hide()
// //       })
// //     });
// $(document).ready(function () {
//   $("#newsurvey").submit(function(e) {
//   	e.preventDefault();
//     $.ajax({
//       type: "post",
//       url: "/users/surveys",
//       data: $(this).serialize()
//         }).done(function(e) {
//           $('#newsurvey').append(e);
//         }).fail(function(e) {
//          alert(e.statusText);
//         });
//   });

// var arr = [1,2,3,4,5]
// for (var i=0; i<arr.length; i++) {
//   var label = arr[i].toString();
//   new Chartkick.PieChart("chart-" +label, [["Blueberry", 44],["Strawberry", 23]]);
// }


// });



// $(document).ready(function(){

//     $.ajax({type: "GET", url: "/surveys/1/statistics"}).done(function(result){
//       $.ajax({type: "post", url: "/surveys/1/statistics"})
//     })

// })