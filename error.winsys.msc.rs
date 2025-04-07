s_

[3.5] | {
       if ext = (true):loop block(type:s) stop_func:('error')
}

[3.5] | {
       if ext = (false):loop stop.process (erf:type)
}

[4.1] | {
        gui {
        size:, height: 100; width: 400;
        windowTitle: "AzureOS Setup Error"
        windowControl = default(winsys) {
          $get_color.pkg
          background: fff; 
        } {
            createMessage_short
            centerMessage: from.data(size) 
            dis.txt  = ("There was an error executing AzureOS.")
}



