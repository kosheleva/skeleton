require(['jquery'], function($) {
    $('.checkboxRead').change(function() {
        if($(this).is(":checked")) {
            $.post($(this).data('url'), {mark: 'read', id: $(this).attr('name'), value: 1}, function() {});
        } else {
            $.post($(this).data('url'), {mark: 'read', id: $(this).attr('name'), value: 0}, function() {});
        }
    });

    $('.checkboxAnswered').change(function() {
        if($(this).is(":checked")) {
            $.post($(this).data('url'), {mark: 'answered', id: $(this).attr('name'), value: 1}, function() {});
        } else {
            $.post($(this).data('url'), {mark: 'answered', id: $(this).attr('name'), value: 0}, function() {});
        }
    });
});
