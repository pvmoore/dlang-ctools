module ctools.Serialiser;

import ctools.all;

public:

/**
 *
 */
final class Serialiser {
public:
    /**
     *  Begin serialisation by writing the header.
     */
    static void begin(ByteWriter w, string hash) {
        serialise(hash, w);
    }
    static void serialise(string s, ByteWriter w) {
        w.write!uint(s.length.as!uint);
        w.writeArray!char(s.ptr[0..s.length].as!(char[]));
    }
    //──────────────────────────────────────────────────────────────────────────────────────────────
    /**
     *  Begin deserialisation by reading the header and comparing it to the hash.
     *  @return false if the hash is incorrect
     */
    static bool begin(ByteReader r, string expectedHash) {
        return expectedHash == deserialiseString(r);
    }
    static string deserialiseString(ByteReader r) {
        auto length = r.read!uint;
        return r.readArray!char(length).as!string;
    }
}

