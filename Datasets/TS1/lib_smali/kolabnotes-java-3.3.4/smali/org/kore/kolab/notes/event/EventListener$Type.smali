.class public final enum Lorg/kore/kolab/notes/event/EventListener$Type;
.super Ljava/lang/Enum;
.source "EventListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/event/EventListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/kore/kolab/notes/event/EventListener$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/kore/kolab/notes/event/EventListener$Type;

.field public static final enum DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

.field public static final enum NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

.field public static final enum UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 29
    new-instance v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v2}, Lorg/kore/kolab/notes/event/EventListener$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    new-instance v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v3}, Lorg/kore/kolab/notes/event/EventListener$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    new-instance v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    const-string v1, "UPDATE"

    invoke-direct {v0, v1, v4}, Lorg/kore/kolab/notes/event/EventListener$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    .line 27
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/kore/kolab/notes/event/EventListener$Type;

    sget-object v1, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    aput-object v1, v0, v3

    sget-object v1, Lorg/kore/kolab/notes/event/EventListener$Type;->UPDATE:Lorg/kore/kolab/notes/event/EventListener$Type;

    aput-object v1, v0, v4

    sput-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->$VALUES:[Lorg/kore/kolab/notes/event/EventListener$Type;

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
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/kore/kolab/notes/event/EventListener$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/event/EventListener$Type;

    return-object v0
.end method

.method public static values()[Lorg/kore/kolab/notes/event/EventListener$Type;
    .registers 1

    .prologue
    .line 27
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->$VALUES:[Lorg/kore/kolab/notes/event/EventListener$Type;

    invoke-virtual {v0}, [Lorg/kore/kolab/notes/event/EventListener$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/kore/kolab/notes/event/EventListener$Type;

    return-object v0
.end method
