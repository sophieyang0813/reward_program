// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .




// function myFunction(value, code) {
//     console.log(value);
//     console.log(code);
//     document.getElementById("hello").innerHTML = "<%= j render 'form', booking: @booking %>";
// }




// alert $('#apply_coupon').data('id')
  
  // $('apply_coupon').submit(function(){
  //   $.ajax({
  //     type: "Post", 
  //     url: $(this).attr("action"),
  //     data: { "purchased_coupon_id" : $(this).val()}, 
  //     dataType: "json",
  //     succss: function(data){
  //       form.append(

  //        "<p> coupon was successfully applied! </p>");
  //     };

  //   })
  // })

// function log(){
//   var form = $('.use_coupon')
//     form.on('submit',function(formSubmissionEvent){
//       formSubmissionEvent.preventDefault();
     
//       var form = $(formSubmissionEvent.currentTarget)
//       console.log(form);

//       $.ajax({
//         url: form.attr('action'),
//         method: form.attr('method'),
//         data: form.serialize(),
//         dataType :'JSON',
//         success: function(response){
//           if (response) {
//             form.append(
//               "<p> coupon was successfully applied! </p>");
//           }
//         }
//       })
//     })
// }

// document.addEventListener("DOMContentLoaded", log);
