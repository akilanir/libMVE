package org.spongycastle.jce.provider;

import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.Principal;
import java.security.cert.CertPathBuilderException;
import java.security.cert.CertPathBuilderResult;
import java.security.cert.CertPathBuilderSpi;
import java.security.cert.CertPathParameters;
import java.security.cert.PKIXBuilderParameters;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.security.auth.x500.X500Principal;
import org.spongycastle.jcajce.PKIXCertStoreSelector;
import org.spongycastle.jcajce.PKIXExtendedBuilderParameters;
import org.spongycastle.jce.exception.ExtCertPathBuilderException;
import org.spongycastle.util.Selector;
import org.spongycastle.util.Store;
import org.spongycastle.util.StoreException;
import org.spongycastle.x509.ExtendedPKIXBuilderParameters;
import org.spongycastle.x509.ExtendedPKIXParameters;
import org.spongycastle.x509.X509AttributeCertStoreSelector;
import org.spongycastle.x509.X509AttributeCertificate;
import org.spongycastle.x509.X509CertStoreSelector;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/provider/PKIXAttrCertPathBuilderSpi.class */
public class PKIXAttrCertPathBuilderSpi extends CertPathBuilderSpi {
    private Exception certPathException;

    @Override // java.security.cert.CertPathBuilderSpi
    public CertPathBuilderResult engineBuild(CertPathParameters params) throws CertPathBuilderException, InvalidAlgorithmParameterException {
        PKIXExtendedBuilderParameters paramsPKIX;
        if (!(params instanceof PKIXBuilderParameters) && !(params instanceof ExtendedPKIXBuilderParameters) && !(params instanceof PKIXExtendedBuilderParameters)) {
            throw new InvalidAlgorithmParameterException("Parameters must be an instance of " + PKIXBuilderParameters.class.getName() + " or " + PKIXExtendedBuilderParameters.class.getName() + ".");
        }
        List targetStores = new ArrayList();
        if (params instanceof PKIXBuilderParameters) {
            PKIXExtendedBuilderParameters.Builder paramsPKIXBldr = new PKIXExtendedBuilderParameters.Builder((PKIXBuilderParameters) params);
            if (params instanceof ExtendedPKIXParameters) {
                ExtendedPKIXBuilderParameters extPKIX = (ExtendedPKIXBuilderParameters) params;
                paramsPKIXBldr.addExcludedCerts(extPKIX.getExcludedCerts());
                paramsPKIXBldr.setMaxPathLength(extPKIX.getMaxPathLength());
                targetStores = extPKIX.getStores();
            }
            paramsPKIX = paramsPKIXBldr.build();
        } else {
            paramsPKIX = (PKIXExtendedBuilderParameters) params;
        }
        List certPathList = new ArrayList();
        Selector certSelect = paramsPKIX.getBaseParameters().getTargetConstraints();
        if (!(certSelect instanceof X509AttributeCertStoreSelector)) {
            throw new CertPathBuilderException("TargetConstraints must be an instance of " + X509AttributeCertStoreSelector.class.getName() + " for " + getClass().getName() + " class.");
        }
        try {
            Collection targets = findCertificates((X509AttributeCertStoreSelector) certSelect, targetStores);
            if (targets.isEmpty()) {
                throw new CertPathBuilderException("No attribute certificate found matching targetContraints.");
            }
            CertPathBuilderResult result = null;
            Iterator targetIter = targets.iterator();
            while (targetIter.hasNext() && result == null) {
                X509AttributeCertificate cert = (X509AttributeCertificate) targetIter.next();
                X509CertStoreSelector selector = new X509CertStoreSelector();
                Principal[] principals = cert.getIssuer().getPrincipals();
                Set issuers = new HashSet();
                for (int i = 0; i < principals.length; i++) {
                    try {
                        if (principals[i] instanceof X500Principal) {
                            selector.setSubject(((X500Principal) principals[i]).getEncoded());
                        }
                        PKIXCertStoreSelector certStoreSelector = new PKIXCertStoreSelector.Builder(selector).build();
                        issuers.addAll(CertPathValidatorUtilities.findCertificates(certStoreSelector, paramsPKIX.getBaseParameters().getCertStores()));
                        issuers.addAll(CertPathValidatorUtilities.findCertificates(certStoreSelector, paramsPKIX.getBaseParameters().getCertificateStores()));
                    } catch (IOException e) {
                        throw new ExtCertPathBuilderException("cannot encode X500Principal.", e);
                    } catch (AnnotatedException e2) {
                        throw new ExtCertPathBuilderException("Public key certificate for attribute certificate cannot be searched.", e2);
                    }
                }
                if (issuers.isEmpty()) {
                    throw new CertPathBuilderException("Public key certificate for attribute certificate cannot be found.");
                }
                Iterator it = issuers.iterator();
                while (it.hasNext() && result == null) {
                    result = build(cert, (X509Certificate) it.next(), paramsPKIX, certPathList);
                }
            }
            if (result == null && this.certPathException != null) {
                throw new ExtCertPathBuilderException("Possible certificate chain could not be validated.", this.certPathException);
            }
            if (result == null && this.certPathException == null) {
                throw new CertPathBuilderException("Unable to find certificate chain.");
            }
            return result;
        } catch (AnnotatedException e3) {
            throw new ExtCertPathBuilderException("Error finding target attribute certificate.", e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:61:0x01b0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.security.cert.CertPathBuilderResult build(org.spongycastle.x509.X509AttributeCertificate r8, java.security.cert.X509Certificate r9, org.spongycastle.jcajce.PKIXExtendedBuilderParameters r10, java.util.List r11) {
        /*
            Method dump skipped, instructions count: 444
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.PKIXAttrCertPathBuilderSpi.build(org.spongycastle.x509.X509AttributeCertificate, java.security.cert.X509Certificate, org.spongycastle.jcajce.PKIXExtendedBuilderParameters, java.util.List):java.security.cert.CertPathBuilderResult");
    }

    protected static Collection findCertificates(X509AttributeCertStoreSelector certSelect, List certStores) throws AnnotatedException {
        Set certs = new HashSet();
        for (Object obj : certStores) {
            if (obj instanceof Store) {
                Store certStore = (Store) obj;
                try {
                    certs.addAll(certStore.getMatches(certSelect));
                } catch (StoreException e) {
                    throw new AnnotatedException("Problem while picking certificates from X.509 store.", e);
                }
            }
        }
        return certs;
    }
}
