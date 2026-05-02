.class final enum Lezvcard/io/xml/XCardReader$ElementType;
.super Ljava/lang/Enum;
.source "XCardReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ElementType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lezvcard/io/xml/XCardReader$ElementType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum group:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum parameter:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum parameterValue:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum parameters:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum property:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum vcard:Lezvcard/io/xml/XCardReader$ElementType;

.field public static final enum vcards:Lezvcard/io/xml/XCardReader$ElementType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 470
    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "vcards"

    invoke-direct {v0, v1, v3}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->vcards:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "vcard"

    invoke-direct {v0, v1, v4}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->vcard:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "group"

    invoke-direct {v0, v1, v5}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->group:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "property"

    invoke-direct {v0, v1, v6}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "parameters"

    invoke-direct {v0, v1, v7}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "parameter"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->parameter:Lezvcard/io/xml/XCardReader$ElementType;

    new-instance v0, Lezvcard/io/xml/XCardReader$ElementType;

    const-string v1, "parameterValue"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lezvcard/io/xml/XCardReader$ElementType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->parameterValue:Lezvcard/io/xml/XCardReader$ElementType;

    .line 468
    const/4 v0, 0x7

    new-array v0, v0, [Lezvcard/io/xml/XCardReader$ElementType;

    sget-object v1, Lezvcard/io/xml/XCardReader$ElementType;->vcards:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v1, v0, v3

    sget-object v1, Lezvcard/io/xml/XCardReader$ElementType;->vcard:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v1, v0, v4

    sget-object v1, Lezvcard/io/xml/XCardReader$ElementType;->group:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v1, v0, v5

    sget-object v1, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v1, v0, v6

    sget-object v1, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lezvcard/io/xml/XCardReader$ElementType;->parameter:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lezvcard/io/xml/XCardReader$ElementType;->parameterValue:Lezvcard/io/xml/XCardReader$ElementType;

    aput-object v2, v0, v1

    sput-object v0, Lezvcard/io/xml/XCardReader$ElementType;->$VALUES:[Lezvcard/io/xml/XCardReader$ElementType;

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
    .line 468
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lezvcard/io/xml/XCardReader$ElementType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 468
    const-class v0, Lezvcard/io/xml/XCardReader$ElementType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lezvcard/io/xml/XCardReader$ElementType;

    return-object v0
.end method

.method public static values()[Lezvcard/io/xml/XCardReader$ElementType;
    .registers 1

    .prologue
    .line 468
    sget-object v0, Lezvcard/io/xml/XCardReader$ElementType;->$VALUES:[Lezvcard/io/xml/XCardReader$ElementType;

    invoke-virtual {v0}, [Lezvcard/io/xml/XCardReader$ElementType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lezvcard/io/xml/XCardReader$ElementType;

    return-object v0
.end method
