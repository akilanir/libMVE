.class public Lorg/slf4j/MDC;
.super Ljava/lang/Object;
.source "MDC.java"


# static fields
.field static final NO_STATIC_MDC_BINDER_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#no_static_mdc_binder"

.field static final NULL_MDCA_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#null_MDCA"

.field static mdcAdapter:Lorg/slf4j/spi/MDCAdapter;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 73
    :try_start_0
    sget-object v3, Lorg/slf4j/impl/StaticMDCBinder;->SINGLETON:Lorg/slf4j/impl/StaticMDCBinder;

    invoke-virtual {v3}, Lorg/slf4j/impl/StaticMDCBinder;->getMDCA()Lorg/slf4j/spi/MDCAdapter;

    move-result-object v3

    sput-object v3, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;
    :try_end_8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_8} :catch_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_31

    .line 89
    :goto_8
    return-void

    .line 74
    :catch_9
    move-exception v2

    .line 75
    .local v2, "ncde":Ljava/lang/NoClassDefFoundError;
    new-instance v3, Lorg/slf4j/helpers/NOPMDCAdapter;

    invoke-direct {v3}, Lorg/slf4j/helpers/NOPMDCAdapter;-><init>()V

    sput-object v3, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    .line 76
    invoke-virtual {v2}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "msg":Ljava/lang/String;
    if-eqz v1, :cond_30

    const-string v3, "org/slf4j/impl/StaticMDCBinder"

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_30

    .line 78
    const-string v3, "Failed to load class \"org.slf4j.impl.StaticMDCBinder\"."

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 79
    const-string v3, "Defaulting to no-operation MDCAdapter implementation."

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 80
    const-string v3, "See http://www.slf4j.org/codes.html#no_static_mdc_binder for further details."

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    goto :goto_8

    .line 83
    :cond_30
    throw v2

    .line 85
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "ncde":Ljava/lang/NoClassDefFoundError;
    :catch_31
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "MDC binding unsuccessful."

    invoke-static {v3, v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_8
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    return-void
.end method

.method public static clear()V
    .registers 2

    .prologue
    .line 163
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_c

    .line 164
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_c
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0}, Lorg/slf4j/spi/MDCAdapter;->clear()V

    .line 168
    return-void
.end method

.method public static get(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 127
    if-nez p0, :cond_a

    .line 128
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key parameter cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_a
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_16

    .line 132
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_16
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0, p0}, Lorg/slf4j/spi/MDCAdapter;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCopyOfContextMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 178
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_c

    .line 179
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_c
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0}, Lorg/slf4j/spi/MDCAdapter;->getCopyOfContextMap()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public static getMDCAdapter()Lorg/slf4j/spi/MDCAdapter;
    .registers 1

    .prologue
    .line 209
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    return-object v0
.end method

.method public static put(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 105
    if-nez p0, :cond_a

    .line 106
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key parameter cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_a
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_16

    .line 109
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_16
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0, p0, p1}, Lorg/slf4j/spi/MDCAdapter;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public static remove(Ljava/lang/String;)V
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 148
    if-nez p0, :cond_a

    .line 149
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key parameter cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :cond_a
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_16

    .line 153
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_16
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0, p0}, Lorg/slf4j/spi/MDCAdapter;->remove(Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public static setContextMap(Ljava/util/Map;)V
    .registers 3
    .param p0, "contextMap"    # Ljava/util/Map;

    .prologue
    .line 195
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    if-nez v0, :cond_c

    .line 196
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MDCAdapter cannot be null. See also http://www.slf4j.org/codes.html#null_MDCA"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 199
    :cond_c
    sget-object v0, Lorg/slf4j/MDC;->mdcAdapter:Lorg/slf4j/spi/MDCAdapter;

    invoke-interface {v0, p0}, Lorg/slf4j/spi/MDCAdapter;->setContextMap(Ljava/util/Map;)V

    .line 200
    return-void
.end method
