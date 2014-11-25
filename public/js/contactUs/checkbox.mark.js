require(['jquery'], function($) {
    $('.checkboxRead').change(function() {
        var value = ($(this).is(":checked")) ? 1 : 0;
        $.post($(this).data('url'), {mark: 'read', id: $(this).attr('name'), value: value}, function() {});
    });

    $('.checkboxAnswered').change(function() {
        var value = ($(this).is(":checked")) ? 1 : 0;
        $.post($(this).data('url'), {mark: 'answered', id: $(this).attr('name'), value: value}, function() {});
    });
});
