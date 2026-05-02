.class public Lfreemarker/log/_NullLoggerFactory;
.super Ljava/lang/Object;
.source "_NullLoggerFactory.java"

# interfaces
.implements Lfreemarker/log/LoggerFactory;


# static fields
.field private static final INSTANCE:Lfreemarker/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    new-instance v0, Lfreemarker/log/_NullLoggerFactory$1;

    invoke-direct {v0}, Lfreemarker/log/_NullLoggerFactory$1;-><init>()V

    sput-object v0, Lfreemarker/log/_NullLoggerFactory;->INSTANCE:Lfreemarker/log/Logger;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    return-void
.end method


# virtual methods
.method public getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;
    .registers 3
    .param p1, "category"    # Ljava/lang/String;

    .prologue
    .line 69
    sget-object v0, Lfreemarker/log/_NullLoggerFactory;->INSTANCE:Lfreemarker/log/Logger;

    return-object v0
.end method
