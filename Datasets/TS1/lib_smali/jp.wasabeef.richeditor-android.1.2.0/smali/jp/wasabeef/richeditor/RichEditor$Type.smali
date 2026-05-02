.class public final enum Ljp/wasabeef/richeditor/RichEditor$Type;
.super Ljava/lang/Enum;
.source "RichEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljp/wasabeef/richeditor/RichEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Ljp/wasabeef/richeditor/RichEditor$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum BOLD:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H1:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H2:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H3:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H4:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H5:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum H6:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum ITALIC:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum STRIKETHROUGH:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum SUBSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum SUPERSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

.field public static final enum UNDERLINE:Ljp/wasabeef/richeditor/RichEditor$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 42
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "BOLD"

    invoke-direct {v0, v1, v3}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->BOLD:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 43
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "ITALIC"

    invoke-direct {v0, v1, v4}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->ITALIC:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 44
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "SUBSCRIPT"

    invoke-direct {v0, v1, v5}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->SUBSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 45
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "SUPERSCRIPT"

    invoke-direct {v0, v1, v6}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->SUPERSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 46
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "STRIKETHROUGH"

    invoke-direct {v0, v1, v7}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->STRIKETHROUGH:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 47
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "UNDERLINE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->UNDERLINE:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 48
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H1"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H1:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 49
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H2"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H2:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 50
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H3"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H3:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 51
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H4"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H4:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 52
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H5"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H5:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 53
    new-instance v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    const-string v1, "H6"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Ljp/wasabeef/richeditor/RichEditor$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->H6:Ljp/wasabeef/richeditor/RichEditor$Type;

    .line 41
    const/16 v0, 0xc

    new-array v0, v0, [Ljp/wasabeef/richeditor/RichEditor$Type;

    sget-object v1, Ljp/wasabeef/richeditor/RichEditor$Type;->BOLD:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v1, v0, v3

    sget-object v1, Ljp/wasabeef/richeditor/RichEditor$Type;->ITALIC:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v1, v0, v4

    sget-object v1, Ljp/wasabeef/richeditor/RichEditor$Type;->SUBSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v1, v0, v5

    sget-object v1, Ljp/wasabeef/richeditor/RichEditor$Type;->SUPERSCRIPT:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v1, v0, v6

    sget-object v1, Ljp/wasabeef/richeditor/RichEditor$Type;->STRIKETHROUGH:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->UNDERLINE:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H1:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H2:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H3:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H4:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H5:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Ljp/wasabeef/richeditor/RichEditor$Type;->H6:Ljp/wasabeef/richeditor/RichEditor$Type;

    aput-object v2, v0, v1

    sput-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->$VALUES:[Ljp/wasabeef/richeditor/RichEditor$Type;

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
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Ljp/wasabeef/richeditor/RichEditor$Type;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    const-class v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Ljp/wasabeef/richeditor/RichEditor$Type;

    return-object v0
.end method

.method public static values()[Ljp/wasabeef/richeditor/RichEditor$Type;
    .registers 1

    .prologue
    .line 41
    sget-object v0, Ljp/wasabeef/richeditor/RichEditor$Type;->$VALUES:[Ljp/wasabeef/richeditor/RichEditor$Type;

    invoke-virtual {v0}, [Ljp/wasabeef/richeditor/RichEditor$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljp/wasabeef/richeditor/RichEditor$Type;

    return-object v0
.end method
