$.fn.serializeObject = function()
    {
    var obj = {};
    var arr = this.serializeArray();
    $.each(arr, function() {
        if (obj[this.name] !== undefined) {
            if (!obj[this.name].push) {
                obj[this.name] = [obj[this.name]];
            }
            obj[this.name].push(this.value || '');
        } else {
            obj[this.name] = this.value || '';
        }
    });
    return obj;
};

$(function() {
    $('#submit').click(function() {
        var data = JSON.stringify($('form').serializeObject());
         $.ajax({
            method: 'post',
            dataType: 'json',
            contentType: 'application/json',
            url: '/kinetic/'+bundle.spaceSlug()+'/app/login.do',
            data: data,
            beforeSend: function(jqXHR, settings){
               console.log('before')
            },
            success: function(data, textStatus, jqXHR){
               window.location.href = bundle.spaceLocation()+'/'+bundle.kappSlug()+'/'
               console.log('success')
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log('error')
            },
            complete: function(jqXHR, settings){
                console.log('complete')
            },
        });
        
    });
});