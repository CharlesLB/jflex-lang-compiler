// TODO: Fazer estrutura do projeto

// TODO: Colocar a lista de samples aqui
// TODO: O output deve ser feito na pasta ./output/lexers com a estrutura do arquivo de entrada

import java.io.FileReader;
import java.io.File;
import java.util.Scanner;

public class App {
  public static void main(String[] args) throws Exception {
    String directoryPath = "samples/sintatic/false";

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
