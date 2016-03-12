import com.hurlant.crypto.tls.SSLConnectionState;

class SSLConnectionStateRW {
    public var read:SSLConnectionState;
    public var write:SSLConnectionState;

    public function new(read:SSLConnectionState, write:SSLConnectionState) {
        this.read = read;
        this.write = write;
    }
}