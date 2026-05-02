package org.spongycastle.jcajce.provider.symmetric.util;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Hashtable;
import java.util.Map;
import javax.crypto.MacSpi;
import javax.crypto.SecretKey;
import javax.crypto.interfaces.PBEKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEParameterSpec;
import org.spongycastle.crypto.CipherParameters;
import org.spongycastle.crypto.Mac;
import org.spongycastle.crypto.params.KeyParameter;
import org.spongycastle.crypto.params.ParametersWithIV;
import org.spongycastle.crypto.params.SkeinParameters;
import org.spongycastle.jcajce.PKCS12Key;
import org.spongycastle.jcajce.provider.symmetric.util.PBE;
import org.spongycastle.jcajce.spec.SkeinParameterSpec;
import org.spongycastle.pqc.jcajce.spec.McElieceCCA2ParameterSpec;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jcajce/provider/symmetric/util/BaseMac.class */
public class BaseMac extends MacSpi implements PBE {
    private Mac macEngine;
    private int scheme;
    private int pbeHash;
    private int keySize;

    protected BaseMac(Mac macEngine) {
        this.scheme = 2;
        this.pbeHash = 1;
        this.keySize = 160;
        this.macEngine = macEngine;
    }

    protected BaseMac(Mac macEngine, int scheme, int pbeHash, int keySize) {
        this.scheme = 2;
        this.pbeHash = 1;
        this.keySize = 160;
        this.macEngine = macEngine;
        this.scheme = scheme;
        this.pbeHash = pbeHash;
        this.keySize = keySize;
    }

    @Override // javax.crypto.MacSpi
    protected void engineInit(Key key, AlgorithmParameterSpec params) throws InvalidKeyException, InvalidAlgorithmParameterException {
        CipherParameters param;
        if (key == null) {
            throw new InvalidKeyException("key is null");
        }
        if (key instanceof PKCS12Key) {
            try {
                SecretKey k = (SecretKey) key;
                try {
                    PBEParameterSpec pbeSpec = (PBEParameterSpec) params;
                    if ((k instanceof PBEKey) && pbeSpec == null) {
                        pbeSpec = new PBEParameterSpec(((PBEKey) k).getSalt(), ((PBEKey) k).getIterationCount());
                    }
                    int digest = 1;
                    int keySize = 160;
                    if (this.macEngine.getAlgorithmName().startsWith("GOST")) {
                        digest = 6;
                        keySize = 256;
                    } else if (this.macEngine.getAlgorithmName().startsWith(McElieceCCA2ParameterSpec.DEFAULT_MD)) {
                        digest = 4;
                        keySize = 256;
                    }
                    param = PBE.Util.makePBEMacParameters(k, 2, digest, keySize, pbeSpec);
                } catch (Exception e) {
                    throw new InvalidAlgorithmParameterException("PKCS12 requires a PBEParameterSpec");
                }
            } catch (Exception e2) {
                throw new InvalidKeyException("PKCS12 requires a SecretKey/PBEKey");
            }
        } else if (key instanceof BCPBEKey) {
            BCPBEKey k2 = (BCPBEKey) key;
            if (k2.getParam() != null) {
                param = k2.getParam();
            } else if (params instanceof PBEParameterSpec) {
                param = PBE.Util.makePBEMacParameters(k2, params);
            } else {
                throw new InvalidAlgorithmParameterException("PBE requires PBE parameters to be set.");
            }
        } else if (params instanceof IvParameterSpec) {
            param = new ParametersWithIV(new KeyParameter(key.getEncoded()), ((IvParameterSpec) params).getIV());
        } else if (params instanceof SkeinParameterSpec) {
            param = new SkeinParameters.Builder(copyMap(((SkeinParameterSpec) params).getParameters())).setKey(key.getEncoded()).build();
        } else if (params == null) {
            param = new KeyParameter(key.getEncoded());
        } else {
            throw new InvalidAlgorithmParameterException("unknown parameter type.");
        }
        this.macEngine.init(param);
    }

    @Override // javax.crypto.MacSpi
    protected int engineGetMacLength() {
        return this.macEngine.getMacSize();
    }

    @Override // javax.crypto.MacSpi
    protected void engineReset() {
        this.macEngine.reset();
    }

    @Override // javax.crypto.MacSpi
    protected void engineUpdate(byte input) {
        this.macEngine.update(input);
    }

    @Override // javax.crypto.MacSpi
    protected void engineUpdate(byte[] input, int offset, int len) {
        this.macEngine.update(input, offset, len);
    }

    @Override // javax.crypto.MacSpi
    protected byte[] engineDoFinal() {
        byte[] out = new byte[engineGetMacLength()];
        this.macEngine.doFinal(out, 0);
        return out;
    }

    private static Hashtable copyMap(Map paramsMap) {
        Hashtable newTable = new Hashtable();
        for (Object key : paramsMap.keySet()) {
            newTable.put(key, paramsMap.get(key));
        }
        return newTable;
    }
}
