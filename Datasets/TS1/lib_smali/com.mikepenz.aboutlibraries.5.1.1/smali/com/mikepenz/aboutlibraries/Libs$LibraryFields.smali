.class public final enum Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;
.super Ljava/lang/Enum;
.source "Libs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/aboutlibraries/Libs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LibraryFields"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum AUTHOR_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum AUTHOR_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_CLASSPATH:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_OPEN_SOURCE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_REPOSITORY_LINK:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_VERSION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LIBRARY_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LICENSE_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LICENSE_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LICENSE_SHORT_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

.field public static final enum LICENSE_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 23
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "AUTHOR_NAME"

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 24
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "AUTHOR_WEBSITE"

    invoke-direct {v0, v1, v4}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 25
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_NAME"

    invoke-direct {v0, v1, v5}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 26
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_DESCRIPTION"

    invoke-direct {v0, v1, v6}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 27
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_VERSION"

    invoke-direct {v0, v1, v7}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_VERSION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 28
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_WEBSITE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 29
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_OPEN_SOURCE"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_OPEN_SOURCE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 30
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_REPOSITORY_LINK"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_REPOSITORY_LINK:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 31
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LIBRARY_CLASSPATH"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_CLASSPATH:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 32
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LICENSE_NAME"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 33
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LICENSE_SHORT_DESCRIPTION"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_SHORT_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 34
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LICENSE_DESCRIPTION"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 35
    new-instance v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    const-string v1, "LICENSE_WEBSITE"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    .line 22
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->AUTHOR_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_VERSION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_OPEN_SOURCE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_REPOSITORY_LINK:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LIBRARY_CLASSPATH:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_NAME:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_SHORT_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_DESCRIPTION:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->LICENSE_WEBSITE:Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->$VALUES:[Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

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
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    return-object v0
.end method

.method public static values()[Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->$VALUES:[Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    invoke-virtual {v0}, [Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/aboutlibraries/Libs$LibraryFields;

    return-object v0
.end method
