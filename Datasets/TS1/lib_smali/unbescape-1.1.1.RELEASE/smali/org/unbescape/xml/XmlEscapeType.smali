.class public final enum Lorg/unbescape/xml/XmlEscapeType;
.super Ljava/lang/Enum;
.source "XmlEscapeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/unbescape/xml/XmlEscapeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/unbescape/xml/XmlEscapeType;

.field public static final enum CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/xml/XmlEscapeType;

.field public static final enum CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

.field public static final enum DECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;

.field public static final enum HEXADECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;


# instance fields
.field private final useCERs:Z

.field private final useHexa:Z


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 57
    new-instance v0, Lorg/unbescape/xml/XmlEscapeType;

    const-string v1, "CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_DECIMAL"

    invoke-direct {v0, v1, v2, v3, v2}, Lorg/unbescape/xml/XmlEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/xml/XmlEscapeType;

    .line 62
    new-instance v0, Lorg/unbescape/xml/XmlEscapeType;

    const-string v1, "CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA"

    invoke-direct {v0, v1, v3, v3, v3}, Lorg/unbescape/xml/XmlEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    .line 67
    new-instance v0, Lorg/unbescape/xml/XmlEscapeType;

    const-string v1, "DECIMAL_REFERENCES"

    invoke-direct {v0, v1, v4, v2, v2}, Lorg/unbescape/xml/XmlEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/xml/XmlEscapeType;->DECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;

    .line 72
    new-instance v0, Lorg/unbescape/xml/XmlEscapeType;

    const-string v1, "HEXADECIMAL_REFERENCES"

    invoke-direct {v0, v1, v5, v2, v3}, Lorg/unbescape/xml/XmlEscapeType;-><init>(Ljava/lang/String;IZZ)V

    sput-object v0, Lorg/unbescape/xml/XmlEscapeType;->HEXADECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;

    .line 52
    const/4 v0, 0x4

    new-array v0, v0, [Lorg/unbescape/xml/XmlEscapeType;

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_DECIMAL:Lorg/unbescape/xml/XmlEscapeType;

    aput-object v1, v0, v2

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->CHARACTER_ENTITY_REFERENCES_DEFAULT_TO_HEXA:Lorg/unbescape/xml/XmlEscapeType;

    aput-object v1, v0, v3

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->DECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;

    aput-object v1, v0, v4

    sget-object v1, Lorg/unbescape/xml/XmlEscapeType;->HEXADECIMAL_REFERENCES:Lorg/unbescape/xml/XmlEscapeType;

    aput-object v1, v0, v5

    sput-object v0, Lorg/unbescape/xml/XmlEscapeType;->$VALUES:[Lorg/unbescape/xml/XmlEscapeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZZ)V
    .registers 5
    .param p3, "useCERs"    # Z
    .param p4, "useHexa"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)V"
        }
    .end annotation

    .prologue
    .line 78
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 79
    iput-boolean p3, p0, Lorg/unbescape/xml/XmlEscapeType;->useCERs:Z

    .line 80
    iput-boolean p4, p0, Lorg/unbescape/xml/XmlEscapeType;->useHexa:Z

    .line 81
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/unbescape/xml/XmlEscapeType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 52
    const-class v0, Lorg/unbescape/xml/XmlEscapeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/unbescape/xml/XmlEscapeType;

    return-object v0
.end method

.method public static values()[Lorg/unbescape/xml/XmlEscapeType;
    .registers 1

    .prologue
    .line 52
    sget-object v0, Lorg/unbescape/xml/XmlEscapeType;->$VALUES:[Lorg/unbescape/xml/XmlEscapeType;

    invoke-virtual {v0}, [Lorg/unbescape/xml/XmlEscapeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/unbescape/xml/XmlEscapeType;

    return-object v0
.end method


# virtual methods
.method getUseCERs()Z
    .registers 2

    .prologue
    .line 84
    iget-boolean v0, p0, Lorg/unbescape/xml/XmlEscapeType;->useCERs:Z

    return v0
.end method

.method getUseHexa()Z
    .registers 2

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/unbescape/xml/XmlEscapeType;->useHexa:Z

    return v0
.end method
