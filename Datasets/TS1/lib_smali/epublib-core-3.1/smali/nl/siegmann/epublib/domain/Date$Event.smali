.class public final enum Lnl/siegmann/epublib/domain/Date$Event;
.super Ljava/lang/Enum;
.source "Date.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/siegmann/epublib/domain/Date;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Event"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lnl/siegmann/epublib/domain/Date$Event;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lnl/siegmann/epublib/domain/Date$Event;

.field public static final enum CREATION:Lnl/siegmann/epublib/domain/Date$Event;

.field public static final enum MODIFICATION:Lnl/siegmann/epublib/domain/Date$Event;

.field public static final enum PUBLICATION:Lnl/siegmann/epublib/domain/Date$Event;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 23
    new-instance v0, Lnl/siegmann/epublib/domain/Date$Event;

    const-string v1, "PUBLICATION"

    const-string v2, "publication"

    invoke-direct {v0, v1, v3, v2}, Lnl/siegmann/epublib/domain/Date$Event;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/Date$Event;->PUBLICATION:Lnl/siegmann/epublib/domain/Date$Event;

    .line 24
    new-instance v0, Lnl/siegmann/epublib/domain/Date$Event;

    const-string v1, "MODIFICATION"

    const-string v2, "modification"

    invoke-direct {v0, v1, v4, v2}, Lnl/siegmann/epublib/domain/Date$Event;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/Date$Event;->MODIFICATION:Lnl/siegmann/epublib/domain/Date$Event;

    .line 25
    new-instance v0, Lnl/siegmann/epublib/domain/Date$Event;

    const-string v1, "CREATION"

    const-string v2, "creation"

    invoke-direct {v0, v1, v5, v2}, Lnl/siegmann/epublib/domain/Date$Event;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lnl/siegmann/epublib/domain/Date$Event;->CREATION:Lnl/siegmann/epublib/domain/Date$Event;

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lnl/siegmann/epublib/domain/Date$Event;

    sget-object v1, Lnl/siegmann/epublib/domain/Date$Event;->PUBLICATION:Lnl/siegmann/epublib/domain/Date$Event;

    aput-object v1, v0, v3

    sget-object v1, Lnl/siegmann/epublib/domain/Date$Event;->MODIFICATION:Lnl/siegmann/epublib/domain/Date$Event;

    aput-object v1, v0, v4

    sget-object v1, Lnl/siegmann/epublib/domain/Date$Event;->CREATION:Lnl/siegmann/epublib/domain/Date$Event;

    aput-object v1, v0, v5

    sput-object v0, Lnl/siegmann/epublib/domain/Date$Event;->$VALUES:[Lnl/siegmann/epublib/domain/Date$Event;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "v"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput-object p3, p0, Lnl/siegmann/epublib/domain/Date$Event;->value:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public static fromValue(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Date$Event;
    .registers 6
    .param p0, "v"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-static {}, Lnl/siegmann/epublib/domain/Date$Event;->values()[Lnl/siegmann/epublib/domain/Date$Event;

    move-result-object v0

    .local v0, "arr$":[Lnl/siegmann/epublib/domain/Date$Event;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_16

    aget-object v1, v0, v2

    .line 35
    .local v1, "c":Lnl/siegmann/epublib/domain/Date$Event;
    iget-object v4, v1, Lnl/siegmann/epublib/domain/Date$Event;->value:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 39
    .end local v1    # "c":Lnl/siegmann/epublib/domain/Date$Event;
    :goto_12
    return-object v1

    .line 34
    .restart local v1    # "c":Lnl/siegmann/epublib/domain/Date$Event;
    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 39
    .end local v1    # "c":Lnl/siegmann/epublib/domain/Date$Event;
    :cond_16
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public static valueOf(Ljava/lang/String;)Lnl/siegmann/epublib/domain/Date$Event;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lnl/siegmann/epublib/domain/Date$Event;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lnl/siegmann/epublib/domain/Date$Event;

    return-object v0
.end method

.method public static values()[Lnl/siegmann/epublib/domain/Date$Event;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lnl/siegmann/epublib/domain/Date$Event;->$VALUES:[Lnl/siegmann/epublib/domain/Date$Event;

    invoke-virtual {v0}, [Lnl/siegmann/epublib/domain/Date$Event;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lnl/siegmann/epublib/domain/Date$Event;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lnl/siegmann/epublib/domain/Date$Event;->value:Ljava/lang/String;

    return-object v0
.end method
