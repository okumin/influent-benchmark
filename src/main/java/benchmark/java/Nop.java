package benchmark.java;

import java.util.concurrent.CompletableFuture;
import influent.forward.ForwardCallback;
import influent.forward.ForwardServer;

public final class Nop {
  public static void main(final String[] args) {
    final ForwardCallback callback = ForwardCallback
        .of(stream -> CompletableFuture.completedFuture(null));

    final ForwardServer server = new ForwardServer.Builder(callback).build();
    server.start();
  }
}
