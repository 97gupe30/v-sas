function wrongPassword() {
    BootstrapDialog.show({
        title: "Error",
        message: 'Wrong username or password..',
        buttons: [{
            icon: 'glyphicon glyphicon-exclamation-sign',
            label: 'Close',
            cssClass: 'btn-warning',
            action: function(dialog) {
                dialog.close();
            }
        }]
    })
}

var $height = 417;
var $active = false;
var $going = false;
$(document).ready(function() {
    $('#navButton').click(function() {
        if($active == false && $going == false) {
            $('#navImg').addClass('glyphicon-menu-up').removeClass('glyphicon-menu-down');
            $going = true;
            if($(window).width() <= 700) {
                $active = true;
                $('#menu ul').animate({
                    height: $height
                }, 300, function(){$going = false;});
                $('nav').animate({
                    height: $height
                }, 300, function(){});
                
            }
        } else if($active == true && $going == false) {
            $('#navImg').addClass('glyphicon-menu-down').removeClass('glyphicon-menu-up');
            $going = true;
            if($(window).width() <= 700) {
                $active = false;
                $('#menu ul').animate({
                    height: 40
                }, 300, function(){$going = false;});
                $('nav').animate({
                    height: 40
                }, 300, function(){});
            }
        } 
    })
})