.class public Linfo/guardianproject/netcipher/client/MyThreadSafeClientConnManager;
.super Lch/boye/httpclientandroidlib/impl/conn/tsccm/ThreadSafeClientConnManager;
.source "MyThreadSafeClientConnManager.java"


# direct methods
.method public constructor <init>(Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V
    .registers 3
    .param p1, "params"    # Lch/boye/httpclientandroidlib/params/HttpParams;
    .param p2, "schreg"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lch/boye/httpclientandroidlib/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lch/boye/httpclientandroidlib/params/HttpParams;Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    .line 13
    return-void
.end method


# virtual methods
.method protected createConnectionOperator(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)Lch/boye/httpclientandroidlib/conn/ClientConnectionOperator;
    .registers 3
    .param p1, "schreg"    # Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;

    .prologue
    .line 18
    new-instance v0, Linfo/guardianproject/netcipher/client/MyDefaultClientConnectionOperator;

    invoke-direct {v0, p1}, Linfo/guardianproject/netcipher/client/MyDefaultClientConnectionOperator;-><init>(Lch/boye/httpclientandroidlib/conn/scheme/SchemeRegistry;)V

    return-object v0
.end method
