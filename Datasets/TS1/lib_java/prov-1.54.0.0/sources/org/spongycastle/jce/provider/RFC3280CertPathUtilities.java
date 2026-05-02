package org.spongycastle.jce.provider;

import java.io.IOException;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.PublicKey;
import java.security.cert.CertPath;
import java.security.cert.CertPathBuilderException;
import java.security.cert.CertPathValidatorException;
import java.security.cert.CertificateExpiredException;
import java.security.cert.CertificateNotYetValidException;
import java.security.cert.PKIXCertPathChecker;
import java.security.cert.X509CRL;
import java.security.cert.X509CRLSelector;
import java.security.cert.X509CertSelector;
import java.security.cert.X509Certificate;
import java.security.cert.X509Extension;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;
import org.spongycastle.asn1.ASN1Encodable;
import org.spongycastle.asn1.ASN1EncodableVector;
import org.spongycastle.asn1.ASN1InputStream;
import org.spongycastle.asn1.ASN1Integer;
import org.spongycastle.asn1.ASN1ObjectIdentifier;
import org.spongycastle.asn1.ASN1Primitive;
import org.spongycastle.asn1.ASN1Sequence;
import org.spongycastle.asn1.ASN1TaggedObject;
import org.spongycastle.asn1.DERSequence;
import org.spongycastle.asn1.x500.RDN;
import org.spongycastle.asn1.x500.X500Name;
import org.spongycastle.asn1.x500.style.BCStyle;
import org.spongycastle.asn1.x509.BasicConstraints;
import org.spongycastle.asn1.x509.CRLDistPoint;
import org.spongycastle.asn1.x509.DistributionPoint;
import org.spongycastle.asn1.x509.DistributionPointName;
import org.spongycastle.asn1.x509.Extension;
import org.spongycastle.asn1.x509.GeneralName;
import org.spongycastle.asn1.x509.GeneralNames;
import org.spongycastle.asn1.x509.GeneralSubtree;
import org.spongycastle.asn1.x509.IssuingDistributionPoint;
import org.spongycastle.asn1.x509.NameConstraints;
import org.spongycastle.asn1.x509.PolicyInformation;
import org.spongycastle.asn1.x509.ReasonFlags;
import org.spongycastle.jcajce.PKIXCRLStoreSelector;
import org.spongycastle.jcajce.PKIXCertStoreSelector;
import org.spongycastle.jcajce.PKIXExtendedBuilderParameters;
import org.spongycastle.jcajce.PKIXExtendedParameters;
import org.spongycastle.jcajce.util.JcaJceHelper;
import org.spongycastle.jce.exception.ExtCertPathValidatorException;
import org.spongycastle.util.Arrays;

/* loaded from: prov-1.54.0.0.jar:org/spongycastle/jce/provider/RFC3280CertPathUtilities.class */
class RFC3280CertPathUtilities {
    public static final String ANY_POLICY = "2.5.29.32.0";
    protected static final int KEY_CERT_SIGN = 5;
    protected static final int CRL_SIGN = 6;
    private static final PKIXCRLUtil CRL_UTIL = new PKIXCRLUtil();
    public static final String CERTIFICATE_POLICIES = Extension.certificatePolicies.getId();
    public static final String POLICY_MAPPINGS = Extension.policyMappings.getId();
    public static final String INHIBIT_ANY_POLICY = Extension.inhibitAnyPolicy.getId();
    public static final String ISSUING_DISTRIBUTION_POINT = Extension.issuingDistributionPoint.getId();
    public static final String FRESHEST_CRL = Extension.freshestCRL.getId();
    public static final String DELTA_CRL_INDICATOR = Extension.deltaCRLIndicator.getId();
    public static final String POLICY_CONSTRAINTS = Extension.policyConstraints.getId();
    public static final String BASIC_CONSTRAINTS = Extension.basicConstraints.getId();
    public static final String CRL_DISTRIBUTION_POINTS = Extension.cRLDistributionPoints.getId();
    public static final String SUBJECT_ALTERNATIVE_NAME = Extension.subjectAlternativeName.getId();
    public static final String NAME_CONSTRAINTS = Extension.nameConstraints.getId();
    public static final String AUTHORITY_KEY_IDENTIFIER = Extension.authorityKeyIdentifier.getId();
    public static final String KEY_USAGE = Extension.keyUsage.getId();
    public static final String CRL_NUMBER = Extension.cRLNumber.getId();
    protected static final String[] crlReasons = {"unspecified", "keyCompromise", "cACompromise", "affiliationChanged", "superseded", "cessationOfOperation", "certificateHold", "unknown", "removeFromCRL", "privilegeWithdrawn", "aACompromise"};

    RFC3280CertPathUtilities() {
    }

    protected static void processCRLB2(DistributionPoint dp, Object cert, X509CRL crl) throws AnnotatedException {
        try {
            IssuingDistributionPoint idp = IssuingDistributionPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(crl, ISSUING_DISTRIBUTION_POINT));
            if (idp != null) {
                if (idp.getDistributionPoint() != null) {
                    DistributionPointName dpName = IssuingDistributionPoint.getInstance(idp).getDistributionPoint();
                    List names = new ArrayList();
                    if (dpName.getType() == 0) {
                        for (GeneralName generalName : GeneralNames.getInstance(dpName.getName()).getNames()) {
                            names.add(generalName);
                        }
                    }
                    if (dpName.getType() == 1) {
                        ASN1EncodableVector vec = new ASN1EncodableVector();
                        try {
                            Enumeration e = ASN1Sequence.getInstance(PrincipalUtils.getIssuerPrincipal(crl)).getObjects();
                            while (e.hasMoreElements()) {
                                vec.add((ASN1Encodable) e.nextElement());
                            }
                            vec.add(dpName.getName());
                            names.add(new GeneralName(X500Name.getInstance(new DERSequence(vec))));
                        } catch (Exception e2) {
                            throw new AnnotatedException("Could not read CRL issuer.", e2);
                        }
                    }
                    boolean matches = false;
                    if (dp.getDistributionPoint() != null) {
                        DistributionPointName dpName2 = dp.getDistributionPoint();
                        GeneralName[] genNames = null;
                        if (dpName2.getType() == 0) {
                            genNames = GeneralNames.getInstance(dpName2.getName()).getNames();
                        }
                        if (dpName2.getType() == 1) {
                            if (dp.getCRLIssuer() != null) {
                                genNames = dp.getCRLIssuer().getNames();
                            } else {
                                genNames = new GeneralName[1];
                                try {
                                    genNames[0] = new GeneralName(X500Name.getInstance(PrincipalUtils.getEncodedIssuerPrincipal(cert).getEncoded()));
                                } catch (Exception e3) {
                                    throw new AnnotatedException("Could not read certificate issuer.", e3);
                                }
                            }
                            for (int j = 0; j < genNames.length; j++) {
                                Enumeration e4 = ASN1Sequence.getInstance(genNames[j].getName().toASN1Primitive()).getObjects();
                                ASN1EncodableVector vec2 = new ASN1EncodableVector();
                                while (e4.hasMoreElements()) {
                                    vec2.add((ASN1Encodable) e4.nextElement());
                                }
                                vec2.add(dpName2.getName());
                                genNames[j] = new GeneralName(X500Name.getInstance(new DERSequence(vec2)));
                            }
                        }
                        if (genNames != null) {
                            int j2 = 0;
                            while (true) {
                                if (j2 >= genNames.length) {
                                    break;
                                }
                                if (!names.contains(genNames[j2])) {
                                    j2++;
                                } else {
                                    matches = true;
                                    break;
                                }
                            }
                        }
                        if (!matches) {
                            throw new AnnotatedException("No match for certificate CRL issuing distribution point name to cRLIssuer CRL distribution point.");
                        }
                    } else {
                        if (dp.getCRLIssuer() == null) {
                            throw new AnnotatedException("Either the cRLIssuer or the distributionPoint field must be contained in DistributionPoint.");
                        }
                        GeneralName[] genNames2 = dp.getCRLIssuer().getNames();
                        int j3 = 0;
                        while (true) {
                            if (j3 >= genNames2.length) {
                                break;
                            }
                            if (!names.contains(genNames2[j3])) {
                                j3++;
                            } else {
                                matches = true;
                                break;
                            }
                        }
                        if (!matches) {
                            throw new AnnotatedException("No match for certificate CRL issuing distribution point name to cRLIssuer CRL distribution point.");
                        }
                    }
                }
                try {
                    BasicConstraints bc = BasicConstraints.getInstance(CertPathValidatorUtilities.getExtensionValue((X509Extension) cert, BASIC_CONSTRAINTS));
                    if (cert instanceof X509Certificate) {
                        if (idp.onlyContainsUserCerts() && bc != null && bc.isCA()) {
                            throw new AnnotatedException("CA Cert CRL only contains user certificates.");
                        }
                        if (idp.onlyContainsCACerts() && (bc == null || !bc.isCA())) {
                            throw new AnnotatedException("End CRL only contains CA certificates.");
                        }
                    }
                    if (idp.onlyContainsAttributeCerts()) {
                        throw new AnnotatedException("onlyContainsAttributeCerts boolean is asserted.");
                    }
                } catch (Exception e5) {
                    throw new AnnotatedException("Basic constraints extension could not be decoded.", e5);
                }
            }
        } catch (Exception e6) {
            throw new AnnotatedException("Issuing distribution point extension could not be decoded.", e6);
        }
    }

    protected static void processCRLB1(DistributionPoint dp, Object cert, X509CRL crl) throws AnnotatedException {
        ASN1Primitive idp = CertPathValidatorUtilities.getExtensionValue(crl, ISSUING_DISTRIBUTION_POINT);
        boolean isIndirect = false;
        if (idp != null && IssuingDistributionPoint.getInstance(idp).isIndirectCRL()) {
            isIndirect = true;
        }
        try {
            byte[] issuerBytes = PrincipalUtils.getIssuerPrincipal(crl).getEncoded();
            boolean matchIssuer = false;
            if (dp.getCRLIssuer() != null) {
                GeneralName[] genNames = dp.getCRLIssuer().getNames();
                for (int j = 0; j < genNames.length; j++) {
                    if (genNames[j].getTagNo() == 4) {
                        try {
                            if (Arrays.areEqual(genNames[j].getName().toASN1Primitive().getEncoded(), issuerBytes)) {
                                matchIssuer = true;
                            }
                        } catch (IOException e) {
                            throw new AnnotatedException("CRL issuer information from distribution point cannot be decoded.", e);
                        }
                    }
                }
                if (matchIssuer && !isIndirect) {
                    throw new AnnotatedException("Distribution point contains cRLIssuer field but CRL is not indirect.");
                }
                if (!matchIssuer) {
                    throw new AnnotatedException("CRL issuer of CRL does not match CRL issuer of distribution point.");
                }
            } else if (PrincipalUtils.getIssuerPrincipal(crl).equals(PrincipalUtils.getEncodedIssuerPrincipal(cert))) {
                matchIssuer = true;
            }
            if (!matchIssuer) {
                throw new AnnotatedException("Cannot find matching CRL issuer for certificate.");
            }
        } catch (IOException e2) {
            throw new AnnotatedException("Exception encoding CRL issuer: " + e2.getMessage(), e2);
        }
    }

    protected static ReasonsMask processCRLD(X509CRL crl, DistributionPoint dp) throws AnnotatedException {
        try {
            IssuingDistributionPoint idp = IssuingDistributionPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(crl, ISSUING_DISTRIBUTION_POINT));
            if (idp != null && idp.getOnlySomeReasons() != null && dp.getReasons() != null) {
                return new ReasonsMask(dp.getReasons()).intersect(new ReasonsMask(idp.getOnlySomeReasons()));
            }
            if ((idp == null || idp.getOnlySomeReasons() == null) && dp.getReasons() == null) {
                return ReasonsMask.allReasons;
            }
            return (dp.getReasons() == null ? ReasonsMask.allReasons : new ReasonsMask(dp.getReasons())).intersect(idp == null ? ReasonsMask.allReasons : new ReasonsMask(idp.getOnlySomeReasons()));
        } catch (Exception e) {
            throw new AnnotatedException("Issuing distribution point extension could not be decoded.", e);
        }
    }

    protected static Set processCRLF(X509CRL crl, Object cert, X509Certificate defaultCRLSignCert, PublicKey defaultCRLSignKey, PKIXExtendedParameters paramsPKIX, List certPathCerts, JcaJceHelper helper) throws AnnotatedException {
        X509CertSelector certSelector = new X509CertSelector();
        try {
            byte[] issuerPrincipal = PrincipalUtils.getIssuerPrincipal(crl).getEncoded();
            certSelector.setSubject(issuerPrincipal);
            PKIXCertStoreSelector selector = new PKIXCertStoreSelector.Builder(certSelector).build();
            try {
                Collection<X509Certificate> coll = CertPathValidatorUtilities.findCertificates(selector, paramsPKIX.getCertificateStores());
                coll.addAll(CertPathValidatorUtilities.findCertificates(selector, paramsPKIX.getCertStores()));
                coll.add(defaultCRLSignCert);
                List validCerts = new ArrayList();
                List validKeys = new ArrayList();
                for (X509Certificate signingCert : coll) {
                    if (signingCert.equals(defaultCRLSignCert)) {
                        validCerts.add(signingCert);
                        validKeys.add(defaultCRLSignKey);
                    } else {
                        try {
                            PKIXCertPathBuilderSpi builder = new PKIXCertPathBuilderSpi();
                            X509CertSelector tmpCertSelector = new X509CertSelector();
                            tmpCertSelector.setCertificate(signingCert);
                            PKIXExtendedParameters.Builder paramsBuilder = new PKIXExtendedParameters.Builder(paramsPKIX).setTargetConstraints(new PKIXCertStoreSelector.Builder(tmpCertSelector).build());
                            if (certPathCerts.contains(signingCert)) {
                                paramsBuilder.setRevocationEnabled(false);
                            } else {
                                paramsBuilder.setRevocationEnabled(true);
                            }
                            PKIXExtendedBuilderParameters extParams = new PKIXExtendedBuilderParameters.Builder(paramsBuilder.build()).build();
                            List certs = builder.engineBuild(extParams).getCertPath().getCertificates();
                            validCerts.add(signingCert);
                            validKeys.add(CertPathValidatorUtilities.getNextWorkingKey(certs, 0, helper));
                        } catch (CertPathBuilderException e) {
                            throw new AnnotatedException("CertPath for CRL signer failed to validate.", e);
                        } catch (CertPathValidatorException e2) {
                            throw new AnnotatedException("Public key of issuer certificate of CRL could not be retrieved.", e2);
                        } catch (Exception e3) {
                            throw new AnnotatedException(e3.getMessage());
                        }
                    }
                }
                Set checkKeys = new HashSet();
                AnnotatedException lastException = null;
                for (int i = 0; i < validCerts.size(); i++) {
                    X509Certificate signCert = (X509Certificate) validCerts.get(i);
                    boolean[] keyusage = signCert.getKeyUsage();
                    if (keyusage != null && (keyusage.length < 7 || !keyusage[6])) {
                        lastException = new AnnotatedException("Issuer certificate key usage extension does not permit CRL signing.");
                    } else {
                        checkKeys.add(validKeys.get(i));
                    }
                }
                if (checkKeys.isEmpty() && lastException == null) {
                    throw new AnnotatedException("Cannot find a valid issuer certificate.");
                }
                if (checkKeys.isEmpty() && lastException != null) {
                    throw lastException;
                }
                return checkKeys;
            } catch (AnnotatedException e4) {
                throw new AnnotatedException("Issuer certificate for CRL cannot be searched.", e4);
            }
        } catch (IOException e5) {
            throw new AnnotatedException("Subject criteria for certificate selector to find issuer certificate for CRL could not be set.", e5);
        }
    }

    protected static PublicKey processCRLG(X509CRL crl, Set keys) throws AnnotatedException {
        Exception lastException = null;
        Iterator it = keys.iterator();
        while (it.hasNext()) {
            PublicKey key = (PublicKey) it.next();
            try {
                crl.verify(key);
                return key;
            } catch (Exception e) {
                lastException = e;
            }
        }
        throw new AnnotatedException("Cannot verify CRL.", lastException);
    }

    protected static X509CRL processCRLH(Set deltacrls, PublicKey key) throws AnnotatedException {
        Exception lastException = null;
        Iterator it = deltacrls.iterator();
        while (it.hasNext()) {
            X509CRL crl = (X509CRL) it.next();
            try {
                crl.verify(key);
                return crl;
            } catch (Exception e) {
                lastException = e;
            }
        }
        if (lastException != null) {
            throw new AnnotatedException("Cannot verify delta CRL.", lastException);
        }
        return null;
    }

    protected static Set processCRLA1i(Date currentDate, PKIXExtendedParameters paramsPKIX, X509Certificate cert, X509CRL crl) throws AnnotatedException {
        Set set = new HashSet();
        if (paramsPKIX.isUseDeltasEnabled()) {
            try {
                CRLDistPoint freshestCRL = CRLDistPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, FRESHEST_CRL));
                if (freshestCRL == null) {
                    try {
                        freshestCRL = CRLDistPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(crl, FRESHEST_CRL));
                    } catch (AnnotatedException e) {
                        throw new AnnotatedException("Freshest CRL extension could not be decoded from CRL.", e);
                    }
                }
                if (freshestCRL != null) {
                    List crlStores = new ArrayList();
                    crlStores.addAll(paramsPKIX.getCRLStores());
                    try {
                        crlStores.addAll(CertPathValidatorUtilities.getAdditionalStoresFromCRLDistributionPoint(freshestCRL, paramsPKIX.getNamedCRLStoreMap()));
                        try {
                            set.addAll(CertPathValidatorUtilities.getDeltaCRLs(currentDate, crl, paramsPKIX.getCertStores(), crlStores));
                        } catch (AnnotatedException e2) {
                            throw new AnnotatedException("Exception obtaining delta CRLs.", e2);
                        }
                    } catch (AnnotatedException e3) {
                        throw new AnnotatedException("No new delta CRL locations could be added from Freshest CRL extension.", e3);
                    }
                }
            } catch (AnnotatedException e4) {
                throw new AnnotatedException("Freshest CRL extension could not be decoded from certificate.", e4);
            }
        }
        return set;
    }

    protected static Set[] processCRLA1ii(Date currentDate, PKIXExtendedParameters paramsPKIX, X509Certificate cert, X509CRL crl) throws AnnotatedException {
        Set deltaSet = new HashSet();
        X509CRLSelector crlselect = new X509CRLSelector();
        crlselect.setCertificateChecking(cert);
        try {
            crlselect.addIssuerName(PrincipalUtils.getIssuerPrincipal(crl).getEncoded());
            PKIXCRLStoreSelector extSelect = new PKIXCRLStoreSelector.Builder(crlselect).setCompleteCRLEnabled(true).build();
            Date validityDate = currentDate;
            if (paramsPKIX.getDate() != null) {
                validityDate = paramsPKIX.getDate();
            }
            Set completeSet = CRL_UTIL.findCRLs(extSelect, validityDate, paramsPKIX.getCertStores(), paramsPKIX.getCRLStores());
            if (paramsPKIX.isUseDeltasEnabled()) {
                try {
                    deltaSet.addAll(CertPathValidatorUtilities.getDeltaCRLs(validityDate, crl, paramsPKIX.getCertStores(), paramsPKIX.getCRLStores()));
                } catch (AnnotatedException e) {
                    throw new AnnotatedException("Exception obtaining delta CRLs.", e);
                }
            }
            return new Set[]{completeSet, deltaSet};
        } catch (IOException e2) {
            throw new AnnotatedException("Cannot extract issuer from CRL." + e2, e2);
        }
    }

    protected static void processCRLC(X509CRL deltaCRL, X509CRL completeCRL, PKIXExtendedParameters pkixParams) throws AnnotatedException {
        if (deltaCRL == null) {
            return;
        }
        try {
            IssuingDistributionPoint completeidp = IssuingDistributionPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(completeCRL, ISSUING_DISTRIBUTION_POINT));
            if (pkixParams.isUseDeltasEnabled()) {
                if (!PrincipalUtils.getIssuerPrincipal(deltaCRL).equals(PrincipalUtils.getIssuerPrincipal(completeCRL))) {
                    throw new AnnotatedException("Complete CRL issuer does not match delta CRL issuer.");
                }
                try {
                    IssuingDistributionPoint deltaidp = IssuingDistributionPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(deltaCRL, ISSUING_DISTRIBUTION_POINT));
                    boolean match = false;
                    if (completeidp == null) {
                        if (deltaidp == null) {
                            match = true;
                        }
                    } else if (completeidp.equals(deltaidp)) {
                        match = true;
                    }
                    if (!match) {
                        throw new AnnotatedException("Issuing distribution point extension from delta CRL and complete CRL does not match.");
                    }
                    try {
                        ASN1Primitive completeKeyIdentifier = CertPathValidatorUtilities.getExtensionValue(completeCRL, AUTHORITY_KEY_IDENTIFIER);
                        try {
                            ASN1Primitive deltaKeyIdentifier = CertPathValidatorUtilities.getExtensionValue(deltaCRL, AUTHORITY_KEY_IDENTIFIER);
                            if (completeKeyIdentifier == null) {
                                throw new AnnotatedException("CRL authority key identifier is null.");
                            }
                            if (deltaKeyIdentifier == null) {
                                throw new AnnotatedException("Delta CRL authority key identifier is null.");
                            }
                            if (!completeKeyIdentifier.equals(deltaKeyIdentifier)) {
                                throw new AnnotatedException("Delta CRL authority key identifier does not match complete CRL authority key identifier.");
                            }
                        } catch (AnnotatedException e) {
                            throw new AnnotatedException("Authority key identifier extension could not be extracted from delta CRL.", e);
                        }
                    } catch (AnnotatedException e2) {
                        throw new AnnotatedException("Authority key identifier extension could not be extracted from complete CRL.", e2);
                    }
                } catch (Exception e3) {
                    throw new AnnotatedException("Issuing distribution point extension from delta CRL could not be decoded.", e3);
                }
            }
        } catch (Exception e4) {
            throw new AnnotatedException("Issuing distribution point extension could not be decoded.", e4);
        }
    }

    protected static void processCRLI(Date validDate, X509CRL deltacrl, Object cert, CertStatus certStatus, PKIXExtendedParameters pkixParams) throws AnnotatedException {
        if (pkixParams.isUseDeltasEnabled() && deltacrl != null) {
            CertPathValidatorUtilities.getCertStatus(validDate, deltacrl, cert, certStatus);
        }
    }

    protected static void processCRLJ(Date validDate, X509CRL completecrl, Object cert, CertStatus certStatus) throws AnnotatedException {
        if (certStatus.getCertStatus() == 11) {
            CertPathValidatorUtilities.getCertStatus(validDate, completecrl, cert, certStatus);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:110:0x00f7, code lost:
    
        continue;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x0190, code lost:
    
        r29 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x0196, code lost:
    
        r0 = org.spongycastle.jce.provider.CertPathValidatorUtilities.getExtensionValue(r0, org.spongycastle.jce.provider.RFC3280CertPathUtilities.CERTIFICATE_POLICIES);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x01a6, code lost:
    
        r31 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x01b5, code lost:
    
        throw new org.spongycastle.jce.exception.ExtCertPathValidatorException("Certificate policies extension could not be decoded.", r31, r10, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x01b6, code lost:
    
        r0 = r0.getObjects();
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x01c4, code lost:
    
        if (r0.hasMoreElements() == false) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x01ca, code lost:
    
        r0 = org.spongycastle.asn1.x509.PolicyInformation.getInstance(r0.nextElement());
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x01d9, code lost:
    
        r33 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x01e8, code lost:
    
        throw new java.security.cert.CertPathValidatorException("Policy information could not be decoded.", r33, r10, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x01f6, code lost:
    
        if (org.spongycastle.jce.provider.RFC3280CertPathUtilities.ANY_POLICY.equals(r0.getPolicyIdentifier().getId()) == false) goto L126;
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x01f9, code lost:
    
        r29 = org.spongycastle.jce.provider.CertPathValidatorUtilities.getQualifierSet(r0.getPolicyQualifiers());
     */
    /* JADX WARN: Code restructure failed: missing block: B:52:0x0206, code lost:
    
        r33 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0215, code lost:
    
        throw new org.spongycastle.jce.exception.ExtCertPathValidatorException("Policy qualifier info set could not be decoded.", r33, r10, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0219, code lost:
    
        r32 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0221, code lost:
    
        if (r0.getCriticalExtensionOIDs() == null) goto L59;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x0224, code lost:
    
        r32 = r0.getCriticalExtensionOIDs().contains(org.spongycastle.jce.provider.RFC3280CertPathUtilities.CERTIFICATE_POLICIES);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0233, code lost:
    
        r0 = (org.spongycastle.jce.provider.PKIXPolicyNode) r0.getParent();
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x0247, code lost:
    
        if (org.spongycastle.jce.provider.RFC3280CertPathUtilities.ANY_POLICY.equals(r0.getValidPolicy()) == false) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x024a, code lost:
    
        r0 = new org.spongycastle.jce.provider.PKIXPolicyNode(new java.util.ArrayList(), r0, (java.util.Set) r0.get(r0), r0, r29, r0, r32);
        r0.addChild(r0);
        r12[r0].add(r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected static org.spongycastle.jce.provider.PKIXPolicyNode prepareCertB(java.security.cert.CertPath r10, int r11, java.util.List[] r12, org.spongycastle.jce.provider.PKIXPolicyNode r13, int r14) throws java.security.cert.CertPathValidatorException {
        /*
            Method dump skipped, instructions count: 820
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.RFC3280CertPathUtilities.prepareCertB(java.security.cert.CertPath, int, java.util.List[], org.spongycastle.jce.provider.PKIXPolicyNode, int):org.spongycastle.jce.provider.PKIXPolicyNode");
    }

    protected static void prepareNextCertA(CertPath certPath, int index) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            ASN1Sequence pm = DERSequence.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, POLICY_MAPPINGS));
            if (pm != null) {
                for (int j = 0; j < pm.size(); j++) {
                    try {
                        ASN1Sequence mapping = DERSequence.getInstance(pm.getObjectAt(j));
                        ASN1ObjectIdentifier issuerDomainPolicy = ASN1ObjectIdentifier.getInstance(mapping.getObjectAt(0));
                        ASN1ObjectIdentifier subjectDomainPolicy = ASN1ObjectIdentifier.getInstance(mapping.getObjectAt(1));
                        if (ANY_POLICY.equals(issuerDomainPolicy.getId())) {
                            throw new CertPathValidatorException("IssuerDomainPolicy is anyPolicy", null, certPath, index);
                        }
                        if (ANY_POLICY.equals(subjectDomainPolicy.getId())) {
                            throw new CertPathValidatorException("SubjectDomainPolicy is anyPolicy,", null, certPath, index);
                        }
                    } catch (Exception e) {
                        throw new ExtCertPathValidatorException("Policy mappings extension contents could not be decoded.", e, certPath, index);
                    }
                }
            }
        } catch (AnnotatedException ex) {
            throw new ExtCertPathValidatorException("Policy mappings extension could not be decoded.", ex, certPath, index);
        }
    }

    protected static void processCertF(CertPath certPath, int index, PKIXPolicyNode validPolicyTree, int explicitPolicy) throws CertPathValidatorException {
        if (explicitPolicy <= 0 && validPolicyTree == null) {
            throw new ExtCertPathValidatorException("No valid policy tree found when one expected.", null, certPath, index);
        }
    }

    protected static PKIXPolicyNode processCertE(CertPath certPath, int index, PKIXPolicyNode validPolicyTree) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            ASN1Sequence certPolicies = DERSequence.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, CERTIFICATE_POLICIES));
            if (certPolicies == null) {
                validPolicyTree = null;
            }
            return validPolicyTree;
        } catch (AnnotatedException e) {
            throw new ExtCertPathValidatorException("Could not read certificate policies extension from certificate.", e, certPath, index);
        }
    }

    protected static void processCertBC(CertPath certPath, int index, PKIXNameConstraintValidator nameConstraintValidator) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        int n = certs.size();
        int i = n - index;
        if (!CertPathValidatorUtilities.isSelfIssued(cert) || i >= n) {
            X500Name principal = PrincipalUtils.getSubjectPrincipal(cert);
            try {
                ASN1Sequence dns = DERSequence.getInstance(principal.getEncoded());
                try {
                    nameConstraintValidator.checkPermittedDN(dns);
                    nameConstraintValidator.checkExcludedDN(dns);
                    try {
                        GeneralNames altName = GeneralNames.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, SUBJECT_ALTERNATIVE_NAME));
                        RDN[] emails = X500Name.getInstance(dns).getRDNs(BCStyle.EmailAddress);
                        for (int eI = 0; eI != emails.length; eI++) {
                            String email = emails[eI].getFirst().getValue().getString();
                            GeneralName emailAsGeneralName = new GeneralName(1, email);
                            try {
                                nameConstraintValidator.checkPermitted(emailAsGeneralName);
                                nameConstraintValidator.checkExcluded(emailAsGeneralName);
                            } catch (PKIXNameConstraintValidatorException ex) {
                                throw new CertPathValidatorException("Subtree check for certificate subject alternative email failed.", ex, certPath, index);
                            }
                        }
                        if (altName != null) {
                            try {
                                GeneralName[] genNames = altName.getNames();
                                for (int j = 0; j < genNames.length; j++) {
                                    try {
                                        nameConstraintValidator.checkPermitted(genNames[j]);
                                        nameConstraintValidator.checkExcluded(genNames[j]);
                                    } catch (PKIXNameConstraintValidatorException e) {
                                        throw new CertPathValidatorException("Subtree check for certificate subject alternative name failed.", e, certPath, index);
                                    }
                                }
                            } catch (Exception e2) {
                                throw new CertPathValidatorException("Subject alternative name contents could not be decoded.", e2, certPath, index);
                            }
                        }
                    } catch (Exception e3) {
                        throw new CertPathValidatorException("Subject alternative name extension could not be decoded.", e3, certPath, index);
                    }
                } catch (PKIXNameConstraintValidatorException e4) {
                    throw new CertPathValidatorException("Subtree check for certificate subject failed.", e4, certPath, index);
                }
            } catch (Exception e5) {
                throw new CertPathValidatorException("Exception extracting subject name when checking subtrees.", e5, certPath, index);
            }
        }
    }

    protected static PKIXPolicyNode processCertD(CertPath certPath, int index, Set acceptablePolicies, PKIXPolicyNode validPolicyTree, List[] policyNodes, int inhibitAnyPolicy) throws CertPathValidatorException {
        String _policy;
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        int n = certs.size();
        int i = n - index;
        try {
            ASN1Sequence certPolicies = DERSequence.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, CERTIFICATE_POLICIES));
            if (certPolicies != null && validPolicyTree != null) {
                Enumeration e = certPolicies.getObjects();
                HashSet hashSet = new HashSet();
                while (e.hasMoreElements()) {
                    PolicyInformation pInfo = PolicyInformation.getInstance(e.nextElement());
                    ASN1ObjectIdentifier pOid = pInfo.getPolicyIdentifier();
                    hashSet.add(pOid.getId());
                    if (!ANY_POLICY.equals(pOid.getId())) {
                        try {
                            Set pq = CertPathValidatorUtilities.getQualifierSet(pInfo.getPolicyQualifiers());
                            boolean match = CertPathValidatorUtilities.processCertD1i(i, policyNodes, pOid, pq);
                            if (!match) {
                                CertPathValidatorUtilities.processCertD1ii(i, policyNodes, pOid, pq);
                            }
                        } catch (CertPathValidatorException ex) {
                            throw new ExtCertPathValidatorException("Policy qualifier info set could not be build.", ex, certPath, index);
                        }
                    }
                }
                if (acceptablePolicies.isEmpty() || acceptablePolicies.contains(ANY_POLICY)) {
                    acceptablePolicies.clear();
                    acceptablePolicies.addAll(hashSet);
                } else {
                    HashSet hashSet2 = new HashSet();
                    for (Object o : acceptablePolicies) {
                        if (hashSet.contains(o)) {
                            hashSet2.add(o);
                        }
                    }
                    acceptablePolicies.clear();
                    acceptablePolicies.addAll(hashSet2);
                }
                if (inhibitAnyPolicy > 0 || (i < n && CertPathValidatorUtilities.isSelfIssued(cert))) {
                    Enumeration e2 = certPolicies.getObjects();
                    while (true) {
                        if (!e2.hasMoreElements()) {
                            break;
                        }
                        PolicyInformation pInfo2 = PolicyInformation.getInstance(e2.nextElement());
                        if (ANY_POLICY.equals(pInfo2.getPolicyIdentifier().getId())) {
                            Set _apq = CertPathValidatorUtilities.getQualifierSet(pInfo2.getPolicyQualifiers());
                            List _nodes = policyNodes[i - 1];
                            for (int k = 0; k < _nodes.size(); k++) {
                                PKIXPolicyNode _node = (PKIXPolicyNode) _nodes.get(k);
                                for (Object _tmp : _node.getExpectedPolicies()) {
                                    if (_tmp instanceof String) {
                                        _policy = (String) _tmp;
                                    } else if (_tmp instanceof ASN1ObjectIdentifier) {
                                        _policy = ((ASN1ObjectIdentifier) _tmp).getId();
                                    }
                                    boolean _found = false;
                                    Iterator _childrenIter = _node.getChildren();
                                    while (_childrenIter.hasNext()) {
                                        PKIXPolicyNode _child = (PKIXPolicyNode) _childrenIter.next();
                                        if (_policy.equals(_child.getValidPolicy())) {
                                            _found = true;
                                        }
                                    }
                                    if (!_found) {
                                        Set _newChildExpectedPolicies = new HashSet();
                                        _newChildExpectedPolicies.add(_policy);
                                        PKIXPolicyNode _newChild = new PKIXPolicyNode(new ArrayList(), i, _newChildExpectedPolicies, _node, _apq, _policy, false);
                                        _node.addChild(_newChild);
                                        policyNodes[i].add(_newChild);
                                    }
                                }
                            }
                        }
                    }
                }
                PKIXPolicyNode _validPolicyTree = validPolicyTree;
                for (int j = i - 1; j >= 0; j--) {
                    List nodes = policyNodes[j];
                    for (int k2 = 0; k2 < nodes.size(); k2++) {
                        PKIXPolicyNode node = (PKIXPolicyNode) nodes.get(k2);
                        if (!node.hasChildren()) {
                            _validPolicyTree = CertPathValidatorUtilities.removePolicyNode(_validPolicyTree, policyNodes, node);
                            if (_validPolicyTree == null) {
                                break;
                            }
                        }
                    }
                }
                Set criticalExtensionOids = cert.getCriticalExtensionOIDs();
                if (criticalExtensionOids != null) {
                    boolean critical = criticalExtensionOids.contains(CERTIFICATE_POLICIES);
                    List nodes2 = policyNodes[i];
                    for (int j2 = 0; j2 < nodes2.size(); j2++) {
                        ((PKIXPolicyNode) nodes2.get(j2)).setCritical(critical);
                    }
                }
                return _validPolicyTree;
            }
            return null;
        } catch (AnnotatedException e3) {
            throw new ExtCertPathValidatorException("Could not read certificate policies extension from certificate.", e3, certPath, index);
        }
    }

    protected static void processCertA(CertPath certPath, PKIXExtendedParameters paramsPKIX, int index, PublicKey workingPublicKey, boolean verificationAlreadyPerformed, X500Name workingIssuerName, X509Certificate sign, JcaJceHelper helper) throws ExtCertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        if (!verificationAlreadyPerformed) {
            try {
                CertPathValidatorUtilities.verifyX509Certificate(cert, workingPublicKey, paramsPKIX.getSigProvider());
            } catch (GeneralSecurityException e) {
                throw new ExtCertPathValidatorException("Could not validate certificate signature.", e, certPath, index);
            }
        }
        try {
            cert.checkValidity(CertPathValidatorUtilities.getValidCertDateFromValidityModel(paramsPKIX, certPath, index));
            if (paramsPKIX.isRevocationEnabled()) {
                try {
                    checkCRLs(paramsPKIX, cert, CertPathValidatorUtilities.getValidCertDateFromValidityModel(paramsPKIX, certPath, index), sign, workingPublicKey, certs, helper);
                } catch (AnnotatedException e2) {
                    Throwable cause = e2;
                    if (null != e2.getCause()) {
                        cause = e2.getCause();
                    }
                    throw new ExtCertPathValidatorException(e2.getMessage(), cause, certPath, index);
                }
            }
            if (!PrincipalUtils.getEncodedIssuerPrincipal(cert).equals(workingIssuerName)) {
                throw new ExtCertPathValidatorException("IssuerName(" + PrincipalUtils.getEncodedIssuerPrincipal(cert) + ") does not match SubjectName(" + workingIssuerName + ") of signing certificate.", null, certPath, index);
            }
        } catch (CertificateExpiredException e3) {
            throw new ExtCertPathValidatorException("Could not validate certificate: " + e3.getMessage(), e3, certPath, index);
        } catch (CertificateNotYetValidException e4) {
            throw new ExtCertPathValidatorException("Could not validate certificate: " + e4.getMessage(), e4, certPath, index);
        } catch (AnnotatedException e5) {
            throw new ExtCertPathValidatorException("Could not validate time of certificate.", e5, certPath, index);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x005f, code lost:
    
        r0 = org.spongycastle.asn1.ASN1Integer.getInstance(r0, false).getValue().intValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0070, code lost:
    
        if (r0 >= r9) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0075, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected static int prepareNextCertI1(java.security.cert.CertPath r7, int r8, int r9) throws java.security.cert.CertPathValidatorException {
        /*
            r0 = r7
            java.util.List r0 = r0.getCertificates()
            r10 = r0
            r0 = r10
            r1 = r8
            java.lang.Object r0 = r0.get(r1)
            java.security.cert.X509Certificate r0 = (java.security.cert.X509Certificate) r0
            r11 = r0
            r0 = 0
            r12 = r0
            r0 = r11
            java.lang.String r1 = org.spongycastle.jce.provider.RFC3280CertPathUtilities.POLICY_CONSTRAINTS     // Catch: java.lang.Exception -> L24
            org.spongycastle.asn1.ASN1Primitive r0 = org.spongycastle.jce.provider.CertPathValidatorUtilities.getExtensionValue(r0, r1)     // Catch: java.lang.Exception -> L24
            org.spongycastle.asn1.ASN1Sequence r0 = org.spongycastle.asn1.DERSequence.getInstance(r0)     // Catch: java.lang.Exception -> L24
            r12 = r0
            goto L35
        L24:
            r13 = move-exception
            org.spongycastle.jce.exception.ExtCertPathValidatorException r0 = new org.spongycastle.jce.exception.ExtCertPathValidatorException
            r1 = r0
            java.lang.String r2 = "Policy constraints extension cannot be decoded."
            r3 = r13
            r4 = r7
            r5 = r8
            r1.<init>(r2, r3, r4, r5)
            throw r0
        L35:
            r0 = r12
            if (r0 == 0) goto L8d
            r0 = r12
            java.util.Enumeration r0 = r0.getObjects()
            r14 = r0
        L41:
            r0 = r14
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto L8d
            r0 = r14
            java.lang.Object r0 = r0.nextElement()     // Catch: java.lang.IllegalArgumentException -> L7c
            org.spongycastle.asn1.ASN1TaggedObject r0 = org.spongycastle.asn1.ASN1TaggedObject.getInstance(r0)     // Catch: java.lang.IllegalArgumentException -> L7c
            r15 = r0
            r0 = r15
            int r0 = r0.getTagNo()     // Catch: java.lang.IllegalArgumentException -> L7c
            if (r0 != 0) goto L79
            r0 = r15
            r1 = 0
            org.spongycastle.asn1.ASN1Integer r0 = org.spongycastle.asn1.ASN1Integer.getInstance(r0, r1)     // Catch: java.lang.IllegalArgumentException -> L7c
            java.math.BigInteger r0 = r0.getValue()     // Catch: java.lang.IllegalArgumentException -> L7c
            int r0 = r0.intValue()     // Catch: java.lang.IllegalArgumentException -> L7c
            r13 = r0
            r0 = r13
            r1 = r9
            if (r0 >= r1) goto L76
            r0 = r13
            return r0
        L76:
            goto L8d
        L79:
            goto L41
        L7c:
            r15 = move-exception
            org.spongycastle.jce.exception.ExtCertPathValidatorException r0 = new org.spongycastle.jce.exception.ExtCertPathValidatorException
            r1 = r0
            java.lang.String r2 = "Policy constraints extension contents cannot be decoded."
            r3 = r15
            r4 = r7
            r5 = r8
            r1.<init>(r2, r3, r4, r5)
            throw r0
        L8d:
            r0 = r9
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.RFC3280CertPathUtilities.prepareNextCertI1(java.security.cert.CertPath, int, int):int");
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x0060, code lost:
    
        r0 = org.spongycastle.asn1.ASN1Integer.getInstance(r0, false).getValue().intValue();
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0071, code lost:
    
        if (r0 >= r9) goto L23;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0076, code lost:
    
        return r0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected static int prepareNextCertI2(java.security.cert.CertPath r7, int r8, int r9) throws java.security.cert.CertPathValidatorException {
        /*
            r0 = r7
            java.util.List r0 = r0.getCertificates()
            r10 = r0
            r0 = r10
            r1 = r8
            java.lang.Object r0 = r0.get(r1)
            java.security.cert.X509Certificate r0 = (java.security.cert.X509Certificate) r0
            r11 = r0
            r0 = 0
            r12 = r0
            r0 = r11
            java.lang.String r1 = org.spongycastle.jce.provider.RFC3280CertPathUtilities.POLICY_CONSTRAINTS     // Catch: java.lang.Exception -> L24
            org.spongycastle.asn1.ASN1Primitive r0 = org.spongycastle.jce.provider.CertPathValidatorUtilities.getExtensionValue(r0, r1)     // Catch: java.lang.Exception -> L24
            org.spongycastle.asn1.ASN1Sequence r0 = org.spongycastle.asn1.DERSequence.getInstance(r0)     // Catch: java.lang.Exception -> L24
            r12 = r0
            goto L35
        L24:
            r13 = move-exception
            org.spongycastle.jce.exception.ExtCertPathValidatorException r0 = new org.spongycastle.jce.exception.ExtCertPathValidatorException
            r1 = r0
            java.lang.String r2 = "Policy constraints extension cannot be decoded."
            r3 = r13
            r4 = r7
            r5 = r8
            r1.<init>(r2, r3, r4, r5)
            throw r0
        L35:
            r0 = r12
            if (r0 == 0) goto L8e
            r0 = r12
            java.util.Enumeration r0 = r0.getObjects()
            r14 = r0
        L41:
            r0 = r14
            boolean r0 = r0.hasMoreElements()
            if (r0 == 0) goto L8e
            r0 = r14
            java.lang.Object r0 = r0.nextElement()     // Catch: java.lang.IllegalArgumentException -> L7d
            org.spongycastle.asn1.ASN1TaggedObject r0 = org.spongycastle.asn1.ASN1TaggedObject.getInstance(r0)     // Catch: java.lang.IllegalArgumentException -> L7d
            r15 = r0
            r0 = r15
            int r0 = r0.getTagNo()     // Catch: java.lang.IllegalArgumentException -> L7d
            r1 = 1
            if (r0 != r1) goto L7a
            r0 = r15
            r1 = 0
            org.spongycastle.asn1.ASN1Integer r0 = org.spongycastle.asn1.ASN1Integer.getInstance(r0, r1)     // Catch: java.lang.IllegalArgumentException -> L7d
            java.math.BigInteger r0 = r0.getValue()     // Catch: java.lang.IllegalArgumentException -> L7d
            int r0 = r0.intValue()     // Catch: java.lang.IllegalArgumentException -> L7d
            r13 = r0
            r0 = r13
            r1 = r9
            if (r0 >= r1) goto L77
            r0 = r13
            return r0
        L77:
            goto L8e
        L7a:
            goto L41
        L7d:
            r15 = move-exception
            org.spongycastle.jce.exception.ExtCertPathValidatorException r0 = new org.spongycastle.jce.exception.ExtCertPathValidatorException
            r1 = r0
            java.lang.String r2 = "Policy constraints extension contents cannot be decoded."
            r3 = r15
            r4 = r7
            r5 = r8
            r1.<init>(r2, r3, r4, r5)
            throw r0
        L8e:
            r0 = r9
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.RFC3280CertPathUtilities.prepareNextCertI2(java.security.cert.CertPath, int, int):int");
    }

    protected static void prepareNextCertG(CertPath certPath, int index, PKIXNameConstraintValidator nameConstraintValidator) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        NameConstraints nc = null;
        try {
            ASN1Sequence ncSeq = DERSequence.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, NAME_CONSTRAINTS));
            if (ncSeq != null) {
                nc = NameConstraints.getInstance(ncSeq);
            }
            if (nc != null) {
                GeneralSubtree[] permitted = nc.getPermittedSubtrees();
                if (permitted != null) {
                    try {
                        nameConstraintValidator.intersectPermittedSubtree(permitted);
                    } catch (Exception ex) {
                        throw new ExtCertPathValidatorException("Permitted subtrees cannot be build from name constraints extension.", ex, certPath, index);
                    }
                }
                GeneralSubtree[] excluded = nc.getExcludedSubtrees();
                if (excluded != null) {
                    for (int i = 0; i != excluded.length; i++) {
                        try {
                            nameConstraintValidator.addExcludedSubtree(excluded[i]);
                        } catch (Exception ex2) {
                            throw new ExtCertPathValidatorException("Excluded subtrees cannot be build from name constraints extension.", ex2, certPath, index);
                        }
                    }
                }
            }
        } catch (Exception e) {
            throw new ExtCertPathValidatorException("Name constraints extension could not be decoded.", e, certPath, index);
        }
    }

    private static void checkCRL(DistributionPoint dp, PKIXExtendedParameters paramsPKIX, X509Certificate cert, Date validDate, X509Certificate defaultCRLSignCert, PublicKey defaultCRLSignKey, CertStatus certStatus, ReasonsMask reasonMask, List certPathCerts, JcaJceHelper helper) throws AnnotatedException {
        Set criticalExtensions;
        Date currentDate = new Date(System.currentTimeMillis());
        if (validDate.getTime() > currentDate.getTime()) {
            throw new AnnotatedException("Validation time is in future.");
        }
        Set crls = CertPathValidatorUtilities.getCompleteCRLs(dp, cert, currentDate, paramsPKIX);
        boolean validCrlFound = false;
        AnnotatedException lastException = null;
        Iterator crl_iter = crls.iterator();
        while (crl_iter.hasNext() && certStatus.getCertStatus() == 11 && !reasonMask.isAllReasons()) {
            try {
                X509CRL crl = (X509CRL) crl_iter.next();
                ReasonsMask interimReasonsMask = processCRLD(crl, dp);
                if (interimReasonsMask.hasNewReasons(reasonMask)) {
                    Set keys = processCRLF(crl, cert, defaultCRLSignCert, defaultCRLSignKey, paramsPKIX, certPathCerts, helper);
                    PublicKey key = processCRLG(crl, keys);
                    X509CRL deltaCRL = null;
                    Date validityDate = currentDate;
                    if (paramsPKIX.getDate() != null) {
                        validityDate = paramsPKIX.getDate();
                    }
                    if (paramsPKIX.isUseDeltasEnabled()) {
                        Set deltaCRLs = CertPathValidatorUtilities.getDeltaCRLs(validityDate, crl, paramsPKIX.getCertStores(), paramsPKIX.getCRLStores());
                        deltaCRL = processCRLH(deltaCRLs, key);
                    }
                    if (paramsPKIX.getValidityModel() != 1 && cert.getNotAfter().getTime() < crl.getThisUpdate().getTime()) {
                        throw new AnnotatedException("No valid CRL for current time found.");
                    }
                    processCRLB1(dp, cert, crl);
                    processCRLB2(dp, cert, crl);
                    processCRLC(deltaCRL, crl, paramsPKIX);
                    processCRLI(validDate, deltaCRL, cert, certStatus, paramsPKIX);
                    processCRLJ(validDate, crl, cert, certStatus);
                    if (certStatus.getCertStatus() == 8) {
                        certStatus.setCertStatus(11);
                    }
                    reasonMask.addReasons(interimReasonsMask);
                    Set criticalExtensions2 = crl.getCriticalExtensionOIDs();
                    if (criticalExtensions2 != null) {
                        Set criticalExtensions3 = new HashSet(criticalExtensions2);
                        criticalExtensions3.remove(Extension.issuingDistributionPoint.getId());
                        criticalExtensions3.remove(Extension.deltaCRLIndicator.getId());
                        if (!criticalExtensions3.isEmpty()) {
                            throw new AnnotatedException("CRL contains unsupported critical extensions.");
                        }
                    }
                    if (deltaCRL != null && (criticalExtensions = deltaCRL.getCriticalExtensionOIDs()) != null) {
                        Set criticalExtensions4 = new HashSet(criticalExtensions);
                        criticalExtensions4.remove(Extension.issuingDistributionPoint.getId());
                        criticalExtensions4.remove(Extension.deltaCRLIndicator.getId());
                        if (!criticalExtensions4.isEmpty()) {
                            throw new AnnotatedException("Delta CRL contains unsupported critical extension.");
                        }
                    }
                    validCrlFound = true;
                }
            } catch (AnnotatedException e) {
                lastException = e;
            }
        }
        if (!validCrlFound) {
            throw lastException;
        }
    }

    protected static void checkCRLs(PKIXExtendedParameters paramsPKIX, X509Certificate cert, Date validDate, X509Certificate sign, PublicKey workingPublicKey, List certPathCerts, JcaJceHelper helper) throws AnnotatedException {
        AnnotatedException lastException = null;
        try {
            CRLDistPoint crldp = CRLDistPoint.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, CRL_DISTRIBUTION_POINTS));
            PKIXExtendedParameters.Builder paramsBldr = new PKIXExtendedParameters.Builder(paramsPKIX);
            try {
                List extras = CertPathValidatorUtilities.getAdditionalStoresFromCRLDistributionPoint(crldp, paramsPKIX.getNamedCRLStoreMap());
                Iterator it = extras.iterator();
                while (it.hasNext()) {
                    paramsBldr.addCRLStore(it.next());
                }
                CertStatus certStatus = new CertStatus();
                ReasonsMask reasonsMask = new ReasonsMask();
                PKIXExtendedParameters finalParams = paramsBldr.build();
                boolean validCrlFound = false;
                if (crldp != null) {
                    try {
                        DistributionPoint[] dps = crldp.getDistributionPoints();
                        if (dps != null) {
                            for (int i = 0; i < dps.length && certStatus.getCertStatus() == 11 && !reasonsMask.isAllReasons(); i++) {
                                try {
                                    checkCRL(dps[i], finalParams, cert, validDate, sign, workingPublicKey, certStatus, reasonsMask, certPathCerts, helper);
                                    validCrlFound = true;
                                } catch (AnnotatedException e) {
                                    lastException = e;
                                }
                            }
                        }
                    } catch (Exception e2) {
                        throw new AnnotatedException("Distribution points could not be read.", e2);
                    }
                }
                if (certStatus.getCertStatus() == 11 && !reasonsMask.isAllReasons()) {
                    try {
                        try {
                            ASN1Primitive issuer = new ASN1InputStream(PrincipalUtils.getEncodedIssuerPrincipal(cert).getEncoded()).readObject();
                            DistributionPoint dp = new DistributionPoint(new DistributionPointName(0, new GeneralNames(new GeneralName(4, issuer))), (ReasonFlags) null, (GeneralNames) null);
                            PKIXExtendedParameters paramsPKIXClone = (PKIXExtendedParameters) paramsPKIX.clone();
                            checkCRL(dp, paramsPKIXClone, cert, validDate, sign, workingPublicKey, certStatus, reasonsMask, certPathCerts, helper);
                            validCrlFound = true;
                        } catch (AnnotatedException e3) {
                            lastException = e3;
                        }
                    } catch (Exception e4) {
                        throw new AnnotatedException("Issuer from certificate for CRL could not be reencoded.", e4);
                    }
                }
                if (!validCrlFound) {
                    if (lastException instanceof AnnotatedException) {
                        throw lastException;
                    }
                    throw new AnnotatedException("No valid CRL found.", lastException);
                }
                if (certStatus.getCertStatus() != 11) {
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z");
                    df.setTimeZone(TimeZone.getTimeZone("UTC"));
                    String message = "Certificate revocation after " + df.format(certStatus.getRevocationDate());
                    throw new AnnotatedException(message + ", reason: " + crlReasons[certStatus.getCertStatus()]);
                }
                if (!reasonsMask.isAllReasons() && certStatus.getCertStatus() == 11) {
                    certStatus.setCertStatus(12);
                }
                if (certStatus.getCertStatus() == 12) {
                    throw new AnnotatedException("Certificate status could not be determined.");
                }
            } catch (AnnotatedException e5) {
                throw new AnnotatedException("No additional CRL locations could be decoded from CRL distribution point extension.", e5);
            }
        } catch (Exception e6) {
            throw new AnnotatedException("CRL distribution point extension could not be read.", e6);
        }
    }

    protected static int prepareNextCertJ(CertPath certPath, int index, int inhibitAnyPolicy) throws CertPathValidatorException {
        int _inhibitAnyPolicy;
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            ASN1Integer iap = ASN1Integer.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, INHIBIT_ANY_POLICY));
            if (iap != null && (_inhibitAnyPolicy = iap.getValue().intValue()) < inhibitAnyPolicy) {
                return _inhibitAnyPolicy;
            }
            return inhibitAnyPolicy;
        } catch (Exception e) {
            throw new ExtCertPathValidatorException("Inhibit any-policy extension cannot be decoded.", e, certPath, index);
        }
    }

    protected static void prepareNextCertK(CertPath certPath, int index) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            BasicConstraints bc = BasicConstraints.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, BASIC_CONSTRAINTS));
            if (bc != null) {
                if (!bc.isCA()) {
                    throw new CertPathValidatorException("Not a CA certificate");
                }
                return;
            }
            throw new CertPathValidatorException("Intermediate certificate lacks BasicConstraints");
        } catch (Exception e) {
            throw new ExtCertPathValidatorException("Basic constraints extension cannot be decoded.", e, certPath, index);
        }
    }

    protected static int prepareNextCertL(CertPath certPath, int index, int maxPathLength) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        if (!CertPathValidatorUtilities.isSelfIssued(cert)) {
            if (maxPathLength <= 0) {
                throw new ExtCertPathValidatorException("Max path length not greater than zero", null, certPath, index);
            }
            return maxPathLength - 1;
        }
        return maxPathLength;
    }

    protected static int prepareNextCertM(CertPath certPath, int index, int maxPathLength) throws CertPathValidatorException {
        BigInteger _pathLengthConstraint;
        int _plc;
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            BasicConstraints bc = BasicConstraints.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, BASIC_CONSTRAINTS));
            if (bc != null && (_pathLengthConstraint = bc.getPathLenConstraint()) != null && (_plc = _pathLengthConstraint.intValue()) < maxPathLength) {
                return _plc;
            }
            return maxPathLength;
        } catch (Exception e) {
            throw new ExtCertPathValidatorException("Basic constraints extension cannot be decoded.", e, certPath, index);
        }
    }

    protected static void prepareNextCertN(CertPath certPath, int index) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        boolean[] _usage = cert.getKeyUsage();
        if (_usage != null && !_usage[5]) {
            throw new ExtCertPathValidatorException("Issuer certificate keyusage extension is critical and does not permit key signing.", null, certPath, index);
        }
    }

    protected static void prepareNextCertO(CertPath certPath, int index, Set criticalExtensions, List pathCheckers) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        Iterator tmpIter = pathCheckers.iterator();
        while (tmpIter.hasNext()) {
            try {
                ((PKIXCertPathChecker) tmpIter.next()).check(cert, criticalExtensions);
            } catch (CertPathValidatorException e) {
                throw new CertPathValidatorException(e.getMessage(), e.getCause(), certPath, index);
            }
        }
        if (!criticalExtensions.isEmpty()) {
            throw new ExtCertPathValidatorException("Certificate has unsupported critical extension: " + criticalExtensions, null, certPath, index);
        }
    }

    protected static int prepareNextCertH1(CertPath certPath, int index, int explicitPolicy) {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        if (!CertPathValidatorUtilities.isSelfIssued(cert) && explicitPolicy != 0) {
            return explicitPolicy - 1;
        }
        return explicitPolicy;
    }

    protected static int prepareNextCertH2(CertPath certPath, int index, int policyMapping) {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        if (!CertPathValidatorUtilities.isSelfIssued(cert) && policyMapping != 0) {
            return policyMapping - 1;
        }
        return policyMapping;
    }

    protected static int prepareNextCertH3(CertPath certPath, int index, int inhibitAnyPolicy) {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        if (!CertPathValidatorUtilities.isSelfIssued(cert) && inhibitAnyPolicy != 0) {
            return inhibitAnyPolicy - 1;
        }
        return inhibitAnyPolicy;
    }

    protected static int wrapupCertA(int explicitPolicy, X509Certificate cert) {
        if (!CertPathValidatorUtilities.isSelfIssued(cert) && explicitPolicy != 0) {
            explicitPolicy--;
        }
        return explicitPolicy;
    }

    protected static int wrapupCertB(CertPath certPath, int index, int explicitPolicy) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        try {
            ASN1Sequence pc = DERSequence.getInstance(CertPathValidatorUtilities.getExtensionValue(cert, POLICY_CONSTRAINTS));
            if (pc != null) {
                Enumeration policyConstraints = pc.getObjects();
                while (policyConstraints.hasMoreElements()) {
                    ASN1TaggedObject constraint = (ASN1TaggedObject) policyConstraints.nextElement();
                    switch (constraint.getTagNo()) {
                        case 0:
                            try {
                                int tmpInt = ASN1Integer.getInstance(constraint, false).getValue().intValue();
                                if (tmpInt != 0) {
                                    break;
                                } else {
                                    return 0;
                                }
                            } catch (Exception e) {
                                throw new ExtCertPathValidatorException("Policy constraints requireExplicitPolicy field could not be decoded.", e, certPath, index);
                            }
                    }
                }
            }
            return explicitPolicy;
        } catch (AnnotatedException e2) {
            throw new ExtCertPathValidatorException("Policy constraints could not be decoded.", e2, certPath, index);
        }
    }

    protected static void wrapupCertF(CertPath certPath, int index, List pathCheckers, Set criticalExtensions) throws CertPathValidatorException {
        List certs = certPath.getCertificates();
        X509Certificate cert = (X509Certificate) certs.get(index);
        Iterator tmpIter = pathCheckers.iterator();
        while (tmpIter.hasNext()) {
            try {
                ((PKIXCertPathChecker) tmpIter.next()).check(cert, criticalExtensions);
            } catch (CertPathValidatorException e) {
                throw new ExtCertPathValidatorException("Additional certificate path checker failed.", e, certPath, index);
            }
        }
        if (!criticalExtensions.isEmpty()) {
            throw new ExtCertPathValidatorException("Certificate has unsupported critical extension: " + criticalExtensions, null, certPath, index);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00d8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected static org.spongycastle.jce.provider.PKIXPolicyNode wrapupCertG(java.security.cert.CertPath r7, org.spongycastle.jcajce.PKIXExtendedParameters r8, java.util.Set r9, int r10, java.util.List[] r11, org.spongycastle.jce.provider.PKIXPolicyNode r12, java.util.Set r13) throws java.security.cert.CertPathValidatorException {
        /*
            Method dump skipped, instructions count: 629
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.spongycastle.jce.provider.RFC3280CertPathUtilities.wrapupCertG(java.security.cert.CertPath, org.spongycastle.jcajce.PKIXExtendedParameters, java.util.Set, int, java.util.List[], org.spongycastle.jce.provider.PKIXPolicyNode, java.util.Set):org.spongycastle.jce.provider.PKIXPolicyNode");
    }
}
