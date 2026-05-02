package gcardone.junidecode;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/* loaded from: junidecode-v0.2.jar:gcardone/junidecode/App.class */
public class App {
    private App() {
    }

    public static void main(String[] args) {
        if (args.length > 0) {
            StringBuilder sb = new StringBuilder();
            for (String s : args) {
                sb.append(Junidecode.unidecode(s)).append(" ");
            }
            System.out.println(sb.toString().trim());
            return;
        }
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
            while (true) {
                String line = br.readLine();
                if (line != null) {
                    System.out.println(Junidecode.unidecode(line));
                } else {
                    return;
                }
            }
        } catch (IOException ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }
}
