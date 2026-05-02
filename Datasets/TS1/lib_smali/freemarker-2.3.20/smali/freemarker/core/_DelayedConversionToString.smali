.class public abstract Lfreemarker/core/_DelayedConversionToString;
.super Ljava/lang/Object;
.source "_DelayedConversionToString.java"


# static fields
.field private static final NOT_SET:Ljava/lang/String;


# instance fields
.field private object:Ljava/lang/Object;

.field private stringValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 6
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0}, Ljava/lang/String;-><init>()V

    sput-object v0, Lfreemarker/core/_DelayedConversionToString;->NOT_SET:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    sget-object v0, Lfreemarker/core/_DelayedConversionToString;->NOT_SET:Ljava/lang/String;

    iput-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->stringValue:Ljava/lang/String;

    .line 12
    iput-object p1, p0, Lfreemarker/core/_DelayedConversionToString;->object:Ljava/lang/Object;

    .line 13
    return-void
.end method


# virtual methods
.method protected abstract doConversion(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 17
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->stringValue:Ljava/lang/String;

    sget-object v1, Lfreemarker/core/_DelayedConversionToString;->NOT_SET:Ljava/lang/String;

    if-ne v0, v1, :cond_12

    .line 18
    iget-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->object:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lfreemarker/core/_DelayedConversionToString;->doConversion(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->stringValue:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->object:Ljava/lang/Object;

    .line 21
    :cond_12
    iget-object v0, p0, Lfreemarker/core/_DelayedConversionToString;->stringValue:Ljava/lang/String;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    monitor-exit p0

    return-object v0

    .line 17
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method
