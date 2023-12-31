import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class grades {
    public static void main(String[] args) {
        String csvFilePath = "HW2data.csv";
        List<String> lines = readCsvFile(csvFilePath);

        List<String> newLines = new ArrayList<>();
        String header = lines.get(0);
        newLines.add(header + ",Score,Grade");

        for ( int i = 1; i < lines.size(); i++) {
            String line = lines.get(i);
            String[] values = line.split(",");

            double hw1 = parseDouble(values[3]);
            double hw2 = parseDouble(values[4]);
            double hw3 = parseDouble(values[5]);
            double midterm = parseDouble(values[6]);
            double finalScore = parseDouble(values[7]);

            double score = hw1 * 0.1 + hw2 * 0.1 + hw3 * 0.1 + midterm * 0.3 + finalScore * 0.4;
            double roundedscore = Math.round(score);
            String grade = calculateGrade(roundedscore);

            line += "," + String.format("%.2f", roundedscore) + "," + grade;
            newLines.add(line);
        }

        writeCsvFile("gradesbyjava.csv", newLines);
    }

    private static double parseDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return 0.0; 
        }
    }

    private static List<String> readCsvFile(String filePath) {
        try {
            return Files.readAllLines(Paths.get(filePath));
        } catch (IOException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    private static void writeCsvFile(String filePath, List<String> lines) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            for (String line : lines) {
                writer.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String calculateGrade(double roundedscore) {
        if (roundedscore < 50) {
            return "E";
        } else if (roundedscore < 60) {
            return "D";
        } else if (roundedscore < 63) {
            return "C-";
        } else if (roundedscore < 67) {
            return "C";
        } else if (roundedscore < 70) {
            return "C+";
        } else if (roundedscore < 73) {
            return "B-";
        } else if (roundedscore < 77) {
            return "B";
        } else if (roundedscore < 80) {
            return "B+";
        } else if (roundedscore < 85) {
            return "A-";
        } else if (roundedscore < 90) {
            return "A";
        } else {
            return "A+";
        }
    }
}
