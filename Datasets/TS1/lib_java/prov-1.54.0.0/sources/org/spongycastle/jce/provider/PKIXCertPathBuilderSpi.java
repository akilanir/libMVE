package org.spongycastle.jce.provider;

import java.security.InvalidAlgorithmParameterException;
import java.security.cert.CertPathBuilderException;
import java.security.cert.CertPathBuilderResult;
import java.security.cert.CertPathBuilderSpi;
import java.security.cert.CertPathParameters;
import java.security.cert.PKIXBuilderParameters;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.spongycastle.jcajce.PKIXCertStore;
import org.spongycastle.jcajce.PKIXCertStoreSelector;
import org.spongycastle.jcajce.PKIXExtendedBuilderParameters;
import org.spongycastle.jcajce.PKIXExtendedParameters;
import org.spongycastle.jce.exception.ExtCertPathBuilderException;
import org.spongycastle.x509.ExtendedPKIXBuilderParameters;
import org.spongycastle.x509.ExtendedPKIXParameters;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/provider/PKIXCertPathBuilderSpi.class */
public class PKIXCertPathBuilderSpi extends CertPathBuilderSpi {
    private Exception certPathException;

    @Override // java.security.cert.CertPathBuilderSpi
    public CertPathBuilderResult engineBuild(CertPathParameters params) throws CertPathBuilderException, InvalidAlgorithmParameterException {
        PKIXExtendedBuilderParameters paramsPKIX;
        PKIXExtendedBuilderParameters.Builder paramsBldrPKIXBldr;
        if (params instanceof PKIXBuilderParameters) {
            PKIXExtendedParameters.Builder paramsPKIXBldr = new PKIXExtendedParameters.Builder((PKIXBuilderParameters) params);
            if (params instanceof ExtendedPKIXParameters) {
                ExtendedPKIXBuilderParameters extPKIX = (ExtendedPKIXBuilderParameters) params;
                Iterator it = extPKIX.getAdditionalStores().iterator();
                while (it.hasNext()) {
                    paramsPKIXBldr.addCertificateStore((PKIXCertStore) it.next());
                }
                paramsBldrPKIXBldr = new PKIXExtendedBuilderParameters.Builder(paramsPKIXBldr.build());
                paramsBldrPKIXBldr.addExcludedCerts(extPKIX.getExcludedCerts());
                paramsBldrPKIXBldr.setMaxPathLength(extPKIX.getMaxPathLength());
            } else {
                paramsBldrPKIXBldr = new PKIXExtendedBuilderParameters.Builder((PKIXBuilderParameters) params);
            }
            paramsPKIX = paramsBldrPKIXBldr.build();
        } else if (params instanceof PKIXExtendedBuilderParameters) {
            paramsPKIX = (PKIXExtendedBuilderParameters) params;
        } else {
            throw new InvalidAlgorithmParameterException("Parameters must be an instance of " + PKIXBuilderParameters.class.getName() + " or " + PKIXExtendedBuilderParameters.class.getName() + ".");
        }
        List certPathList = new ArrayList();
        PKIXCertStoreSelector certSelect = paramsPKIX.getBaseParameters().getTargetConstraints();
        try {
            Collection targets = CertPathValidatorUtilities.findCertificates(certSelect, paramsPKIX.getBaseParameters().getCertificateStores());
            targets.addAll(CertPathValidatorUtilities.findCertificates(certSelect, paramsPKIX.getBaseParameters().getCertStores()));
            if (targets.isEmpty()) {
                throw new CertPathBuilderException("No certificate found matching targetContraints.");
            }
            CertPathBuilderResult result = null;
            Iterator targetIter = targets.iterator();
            while (targetIter.hasNext() && result == null) {
                X509Certificate cert = (X509Certificate) targetIter.next();
                result = build(cert, paramsPKIX, certPathList);
            }
            if (result == null && this.certPathException != null) {
                if (this.certPathException instanceof AnnotatedException) {
                    throw new CertPathBuilderException(this.certPathException.getMessage(), this.certPathException.getCause());
                }
                throw new CertPathBuilderException("Possible certificate chain could not be validated.", this.certPathException);
            }
            if (result == null && this.certPathException == null) {
                throw new CertPathBuilderException("Unable to find certificate chain.");
            }
            return result;
        } catch (AnnotatedException e) {
            throw new ExtCertPathBuilderException("Error finding target certificate.", e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x0194  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.security.cert.CertPathBuilderResult build(java.security.cert.X509Certificate r8, org.spongycastle.jcajce.PKIXExtendedBuilderParameters r9, java.util.List r10) {
        /*
            Method dump skipped, instructions count: 415
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.PKIXCertPathBuilderSpi.build(java.security.cert.X509Certificate, org.spongycastle.jcajce.PKIXExtendedBuilderParameters, java.util.List):java.security.cert.CertPathBuilderResult");
    }
}
