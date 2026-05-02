.class final enum Lcom/einmalfel/earl/RSSTextInput$ST;
.super Ljava/lang/Enum;
.source "RSSTextInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/einmalfel/earl/RSSTextInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ST"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/einmalfel/earl/RSSTextInput$ST;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/einmalfel/earl/RSSTextInput$ST;

.field public static final enum description:Lcom/einmalfel/earl/RSSTextInput$ST;

.field public static final enum link:Lcom/einmalfel/earl/RSSTextInput$ST;

.field public static final enum name:Lcom/einmalfel/earl/RSSTextInput$ST;

.field public static final enum title:Lcom/einmalfel/earl/RSSTextInput$ST;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 18
    new-instance v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    const-string v1, "title"

    invoke-direct {v0, v1, v2}, Lcom/einmalfel/earl/RSSTextInput$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->title:Lcom/einmalfel/earl/RSSTextInput$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    const-string v1, "description"

    invoke-direct {v0, v1, v3}, Lcom/einmalfel/earl/RSSTextInput$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->description:Lcom/einmalfel/earl/RSSTextInput$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    const-string v1, "name"

    invoke-direct {v0, v1, v4}, Lcom/einmalfel/earl/RSSTextInput$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->name:Lcom/einmalfel/earl/RSSTextInput$ST;

    new-instance v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    const-string v1, "link"

    invoke-direct {v0, v1, v5}, Lcom/einmalfel/earl/RSSTextInput$ST;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->link:Lcom/einmalfel/earl/RSSTextInput$ST;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/einmalfel/earl/RSSTextInput$ST;

    sget-object v1, Lcom/einmalfel/earl/RSSTextInput$ST;->title:Lcom/einmalfel/earl/RSSTextInput$ST;

    aput-object v1, v0, v2

    sget-object v1, Lcom/einmalfel/earl/RSSTextInput$ST;->description:Lcom/einmalfel/earl/RSSTextInput$ST;

    aput-object v1, v0, v3

    sget-object v1, Lcom/einmalfel/earl/RSSTextInput$ST;->name:Lcom/einmalfel/earl/RSSTextInput$ST;

    aput-object v1, v0, v4

    sget-object v1, Lcom/einmalfel/earl/RSSTextInput$ST;->link:Lcom/einmalfel/earl/RSSTextInput$ST;

    aput-object v1, v0, v5

    sput-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->$VALUES:[Lcom/einmalfel/earl/RSSTextInput$ST;

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
    .line 18
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/einmalfel/earl/RSSTextInput$ST;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 18
    const-class v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/einmalfel/earl/RSSTextInput$ST;

    return-object v0
.end method

.method public static values()[Lcom/einmalfel/earl/RSSTextInput$ST;
    .registers 1

    .prologue
    .line 18
    sget-object v0, Lcom/einmalfel/earl/RSSTextInput$ST;->$VALUES:[Lcom/einmalfel/earl/RSSTextInput$ST;

    invoke-virtual {v0}, [Lcom/einmalfel/earl/RSSTextInput$ST;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/einmalfel/earl/RSSTextInput$ST;

    return-object v0
.end method
