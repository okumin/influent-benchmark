package benchmark.java;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.Executors;
import influent.forward.ForwardCallback;
import influent.forward.ForwardServer;

public class Logging {
  private static final Logger logger = LoggerFactory.getLogger(Logging.class);

  public static void main(final String[] args) {
    final ForwardCallback callback = ForwardCallback.ofSyncConsumer(
        stream -> logger.info(stream.toString()),
        Executors.newFixedThreadPool(
            args.length == 0 ? Runtime.getRuntime().availableProcessors() : Integer.valueOf(args[0])
        )
    );

    final ForwardServer server = new ForwardServer.Builder(callback).build();
    server.start();
  }
}
