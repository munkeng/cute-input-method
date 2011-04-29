import Qt 4.7

Flickable {
    id : flick

    width : 300
    height : 200
    contentWidth : edit.paintedWidth
    contentHeight : edit.paintedHeight
    clip : true
    boundsBehavior : Flickable.StopAtBounds
    /*property string text*/

    function ensureVisible( r )
    {
        if ( contentX >= r.x )
            contentX = r.x ;
        else if ( contentX+width <= r.x + r.width )
            contentX = r.x + r.width - width ;
        if ( contentY >= r.y )
            contentY = r.y ;
        else if ( contentY+height <= r.y + r.height )
            contentY = r.y + r.height - height ;
    }

    TextEdit {
        id : edit
        width : flick.width
        height : flick.height
        focus : true
        activeFocusOnPress : false
        wrapMode : TextEdit.Wrap
        onCursorRectangleChanged : flick.ensureVisible(cursorRectangle)
        text : document.text
        cursorPosition : document.cursorPosition
        onCursorPositionChanged : document.setCursorPosition( cursorPosition )
    }
}
