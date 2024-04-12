// Nome: Charles Lelis Braga - Matrícula: 202035015
// Nome: Gabriella Carvalho -- Matrícula: 202165047AC

import java.io.FileReader;
import java.io.File;
import java.util.Scanner;

import src.lexer.TOKEN_TYPE;
import src.lexer.Token;
import src.lexer.Lexer;

public class App {
  private static String selectFolder(File[] folders) {
    System.out.println("Selecione um pasta:");
    for (int i = 0; i < folders.length; i++) {
      System.out.println((i + 1) + ". " + folders[i].getName());
    }

    Scanner scanner = new Scanner(System.in);
    int choice = -1;

    while (choice < 1 || choice > folders.length) {
      System.out.print("Digite o número do pasta para selecionar: ");
      choice = scanner.nextInt();
    }
    File selectedFolder = folders[choice - 1];
    System.out.println("Você selecionou: " + selectedFolder.getPath());

    return selectedFolder.getPath();
  }

  public static void main(String[] args) throws Exception {
    String directoryPath = "samples/sintatic/";

    File directory_folder = new File(directoryPath);
    File[] folders = directory_folder.listFiles();

    if (folders != null || folders.length != 0) {
      directoryPath = selectFolder(folders);
    }

    File directory = new File(directoryPath);
    File[] files = directory.listFiles();

    if (files == null || files.length == 0) {
      System.out.println("Não há arquivos no diretório especificado.");
      return;
    }

    // Exibir um menu com os arquivos disponíveis
    System.out.println("Selecione um arquivo:");
    for (int i = 0; i < files.length; i++) {
      System.out.println((i + 1) + ". " + files[i].getName());
    }

    // Ler a entrada do usuário para selecionar um arquivo
    Scanner scanner = new Scanner(System.in);
    int choice = -1;

    while (choice < 1 || choice > files.length) {
      System.out.print("Digite o número do arquivo para selecionar: ");
      choice = scanner.nextInt();
    }

    // Processar o arquivo selecionado
    File selectedFile = files[choice - 1];
    System.out.println("Você selecionou: " + selectedFile.getPath());

    Lexer lx = new Lexer(new FileReader(selectedFile));
    Token t = lx.nextToken();
    while (t != null) {
      System.out.println(t.toString());
      t = lx.nextToken();
    }

  }

}
