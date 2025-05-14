package Dijkstra;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        scanner.nextLine();

        if (n > 26) {
            System.out.println("Пожалуйста, введите число от 1 до 26.");
            return;
        }

        Vertex[] vertices = new Vertex[n];
        char[] letters = new char[n];

        for (int i = 0; i < n; i++) {
            letters[i] = (char) ('A' + i);
            vertices[i] = new Vertex(String.valueOf(letters[i]));
        }

        for (int j = 0; j < n * (n + 1) / 2; j++) {
            String input = scanner.nextLine();
            String[] numbers = input.split(" ");
            List<Integer> vN = new ArrayList<>();

            for (String number : numbers) {
                try {
                    int num = Integer.parseInt(number);
                    vN.add(num);
                } catch (NumberFormatException e) {
                    System.out.println(number + " не является числом.");
                }
            }
            if (vN.get(0) == -1) {
                System.out.println("Выход из ввода данных.");
                break;
            }
            if (vN.size() == 3) {
                vertices[vN.get(0)].addNeighbour(new Edge(vertices[vN.get(0)], vertices[vN.get(1)], vN.get(2)));
            } else if (!vN.isEmpty()) {
                System.out.println("Недостаточно элементов для добавления соседа.");
            }
            vN.clear();
        }


        int s = scanner.nextInt();
        int e = scanner.nextInt();

        Dijkstra dijkstra = new Dijkstra();
        dijkstra.compute(vertices[s]);
        System.out.println(vertices[e].getDistance());
    }
}
