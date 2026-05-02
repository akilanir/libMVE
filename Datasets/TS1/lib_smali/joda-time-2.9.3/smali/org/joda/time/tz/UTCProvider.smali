.class public final Lorg/joda/time/tz/UTCProvider;
.super Ljava/lang/Object;
.source "UTCProvider.java"

# interfaces
.implements Lorg/joda/time/tz/Provider;


# static fields
.field private static final AVAILABLE_IDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/joda/time/tz/UTCProvider;->AVAILABLE_IDS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public getAvailableIDs()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    sget-object v0, Lorg/joda/time/tz/UTCProvider;->AVAILABLE_IDS:Ljava/util/Set;

    return-object v0
.end method

.method public getZone(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;
    .registers 3

    .prologue
    .line 50
    const-string v0, "UTC"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 51
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 53
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
