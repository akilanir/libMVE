.class public final enum Lorg/kore/kolab/notes/Note$Classification;
.super Ljava/lang/Enum;
.source "Note.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/Note;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Classification"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/kore/kolab/notes/Note$Classification;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/kore/kolab/notes/Note$Classification;

.field public static final enum CONFIDENTIAL:Lorg/kore/kolab/notes/Note$Classification;

.field public static final enum PRIVATE:Lorg/kore/kolab/notes/Note$Classification;

.field public static final enum PUBLIC:Lorg/kore/kolab/notes/Note$Classification;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 208
    new-instance v0, Lorg/kore/kolab/notes/Note$Classification;

    const-string v1, "PUBLIC"

    invoke-direct {v0, v1, v2}, Lorg/kore/kolab/notes/Note$Classification;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    .line 209
    new-instance v0, Lorg/kore/kolab/notes/Note$Classification;

    const-string v1, "CONFIDENTIAL"

    invoke-direct {v0, v1, v3}, Lorg/kore/kolab/notes/Note$Classification;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/Note$Classification;->CONFIDENTIAL:Lorg/kore/kolab/notes/Note$Classification;

    .line 210
    new-instance v0, Lorg/kore/kolab/notes/Note$Classification;

    const-string v1, "PRIVATE"

    invoke-direct {v0, v1, v4}, Lorg/kore/kolab/notes/Note$Classification;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/Note$Classification;->PRIVATE:Lorg/kore/kolab/notes/Note$Classification;

    .line 206
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/kore/kolab/notes/Note$Classification;

    sget-object v1, Lorg/kore/kolab/notes/Note$Classification;->PUBLIC:Lorg/kore/kolab/notes/Note$Classification;

    aput-object v1, v0, v2

    sget-object v1, Lorg/kore/kolab/notes/Note$Classification;->CONFIDENTIAL:Lorg/kore/kolab/notes/Note$Classification;

    aput-object v1, v0, v3

    sget-object v1, Lorg/kore/kolab/notes/Note$Classification;->PRIVATE:Lorg/kore/kolab/notes/Note$Classification;

    aput-object v1, v0, v4

    sput-object v0, Lorg/kore/kolab/notes/Note$Classification;->$VALUES:[Lorg/kore/kolab/notes/Note$Classification;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 206
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/kore/kolab/notes/Note$Classification;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 206
    const-class v0, Lorg/kore/kolab/notes/Note$Classification;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/Note$Classification;

    return-object v0
.end method

.method public static values()[Lorg/kore/kolab/notes/Note$Classification;
    .registers 1

    .prologue
    .line 206
    sget-object v0, Lorg/kore/kolab/notes/Note$Classification;->$VALUES:[Lorg/kore/kolab/notes/Note$Classification;

    invoke-virtual {v0}, [Lorg/kore/kolab/notes/Note$Classification;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/kore/kolab/notes/Note$Classification;

    return-object v0
.end method
