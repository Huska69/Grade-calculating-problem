open TextIO;

print "Code Started\n";

fun readFileContents filePath =
    let
        val file = openIn filePath
        val _ = case inputLine file of
                    NONE => ()
                  | SOME _ => ()  (* Skip the header row *)
        fun readLines instream =
            case inputLine instream of
                NONE => ()
              | SOME line =>
                    let
                        val columns = String.tokens (fn c => c = #",") line 
                    in
                        if length columns >= 4 then (*Check if the row would have at least four column*)
                            let
                                val ID = List.nth (columns,1)
                                val column4 = List.nth (columns, 3)
                                val column5 = List.nth (columns, 4)
                                val column6 = List.nth (columns, 5)
                                val column7 = List.nth (columns, 6)
                                val column8 = List.nth (columns, 7)

                                val HW1 = case Real.fromString column4 of
                                        NONE => 0.0  (* or any other default value or error handling *)
                                        | SOME value => value * 0.1

                                val HW2 = case Real.fromString column5 of
                                        NONE => 0.0  (* or any other default value or error handling *)
                                        | SOME value => value * 0.1

                                val HW3 = case Real.fromString column6 of
                                        NONE => 0.0  (* or any other default value or error handling *)
                                        | SOME value => value * 0.1

                                val Midterm = case Real.fromString column7 of
                                        NONE => 0.0  (* or any other default value or error handling *)
                                        | SOME value => value * 0.3

                                val Final = case Real.fromString column8 of
                                        NONE => 0.0  (* or any other default value or error handling *)
                                        | SOME value => value * 0.4      

                                val Scores = HW1 + HW2 + HW3 + Midterm + Final;

                                val Grade = if Scores >= 0.0 andalso Scores <= 49.9 then
                                                "E"
                                            else if Scores >= 50.0 andalso Scores <= 59.9 then
                                                "D"
                                            else if Scores >= 60.0 andalso Scores <= 62.9 then
                                                "C-"
                                            else if Scores >= 63.0 andalso Scores <= 66.9 then
                                                "C"
                                            else if Scores >= 67.0 andalso Scores <= 69.9 then
                                                "C+"
                                            else if Scores >= 70.0 andalso Scores <= 72.9 then
                                                "B-"
                                            else if Scores >= 73.0 andalso Scores <= 76.9 then
                                                "B"
                                            else if Scores >= 77.0 andalso Scores <= 79.9 then
                                                "B+"
                                            else if Scores >= 80.0 andalso Scores <= 84.9 then
                                                "A-"
                                            else if Scores >= 85.0 andalso Scores <= 89.9 then
                                                "A"            
                                            else
                                                "A+"            
                            in
                                TextIO.output (TextIO.stdOut, ID ^ "    " ^ Real.toString Scores ^ "    " ^ Grade ^ "\n")
                            end
                        else
                            ();
                        readLines instream  (* Recursive call to process the next line *)
                    end
    in
        readLines file;
        closeIn file
    end;

readFileContents "HW2data.csv"; (* Call the function with the path to the file *)

OS.Process.exit(OS.Process.success);
