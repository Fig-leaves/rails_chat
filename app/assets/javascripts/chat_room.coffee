# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('#message_box')
        .on 'ajax:complete', (event, ajax, status) -> 
            res = $.parseJSON(ajax.responseText)
            $('#message_content').val("")
            content = "<li>" + res.content + "</li>"
            $('#chat_list').append(content)
