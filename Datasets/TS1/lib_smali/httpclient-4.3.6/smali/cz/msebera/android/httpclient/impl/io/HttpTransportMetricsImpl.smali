.class public Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;
.super Ljava/lang/Object;
.source "HttpTransportMetricsImpl.java"

# interfaces
.implements Lcz/msebera/android/httpclient/io/HttpTransportMetrics;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private bytesTransferred:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    .line 45
    return-void
.end method


# virtual methods
.method public getBytesTransferred()J
    .registers 3

    .prologue
    .line 48
    iget-wide v0, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    return-wide v0
.end method

.method public incrementBytesTransferred(J)V
    .registers 5
    .param p1, "count"    # J

    .prologue
    .line 56
    iget-wide v0, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    .line 57
    return-void
.end method

.method public reset()V
    .registers 3

    .prologue
    .line 60
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    .line 61
    return-void
.end method

.method public setBytesTransferred(J)V
    .registers 3
    .param p1, "count"    # J

    .prologue
    .line 52
    iput-wide p1, p0, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;->bytesTransferred:J

    .line 53
    return-void
.end method
