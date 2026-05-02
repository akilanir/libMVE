.class public abstract enum Lbutterknife/ButterKnife$Finder;
.super Ljava/lang/Enum;
.source "ButterKnife.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lbutterknife/ButterKnife;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "Finder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lbutterknife/ButterKnife$Finder;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lbutterknife/ButterKnife$Finder;

.field public static final enum ACTIVITY:Lbutterknife/ButterKnife$Finder;

.field public static final enum DIALOG:Lbutterknife/ButterKnife$Finder;

.field public static final enum VIEW:Lbutterknife/ButterKnife$Finder;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 97
    new-instance v0, Lbutterknife/ButterKnife$Finder$1;

    const-string v1, "VIEW"

    invoke-direct {v0, v1, v2}, Lbutterknife/ButterKnife$Finder$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbutterknife/ButterKnife$Finder;->VIEW:Lbutterknife/ButterKnife$Finder;

    .line 106
    new-instance v0, Lbutterknife/ButterKnife$Finder$2;

    const-string v1, "ACTIVITY"

    invoke-direct {v0, v1, v3}, Lbutterknife/ButterKnife$Finder$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbutterknife/ButterKnife$Finder;->ACTIVITY:Lbutterknife/ButterKnife$Finder;

    .line 115
    new-instance v0, Lbutterknife/ButterKnife$Finder$3;

    const-string v1, "DIALOG"

    invoke-direct {v0, v1, v4}, Lbutterknife/ButterKnife$Finder$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lbutterknife/ButterKnife$Finder;->DIALOG:Lbutterknife/ButterKnife$Finder;

    .line 95
    const/4 v0, 0x3

    new-array v0, v0, [Lbutterknife/ButterKnife$Finder;

    sget-object v1, Lbutterknife/ButterKnife$Finder;->VIEW:Lbutterknife/ButterKnife$Finder;

    aput-object v1, v0, v2

    sget-object v1, Lbutterknife/ButterKnife$Finder;->ACTIVITY:Lbutterknife/ButterKnife$Finder;

    aput-object v1, v0, v3

    sget-object v1, Lbutterknife/ButterKnife$Finder;->DIALOG:Lbutterknife/ButterKnife$Finder;

    aput-object v1, v0, v4

    sput-object v0, Lbutterknife/ButterKnife$Finder;->$VALUES:[Lbutterknife/ButterKnife$Finder;

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
    .line 96
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILbutterknife/ButterKnife$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lbutterknife/ButterKnife$1;

    .prologue
    .line 96
    invoke-direct {p0, p1, p2}, Lbutterknife/ButterKnife$Finder;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static varargs arrayOf([Landroid/view/View;)[Landroid/view/View;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "views":[Landroid/view/View;, "[TT;"
    return-object p0
.end method

.method public static varargs listOf([Landroid/view/View;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">([TT;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "views":[Landroid/view/View;, "[TT;"
    new-instance v0, Lbutterknife/ImmutableViewList;

    invoke-direct {v0, p0}, Lbutterknife/ImmutableViewList;-><init>([Landroid/view/View;)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lbutterknife/ButterKnife$Finder;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 95
    const-class v0, Lbutterknife/ButterKnife$Finder;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lbutterknife/ButterKnife$Finder;

    return-object v0
.end method

.method public static values()[Lbutterknife/ButterKnife$Finder;
    .registers 1

    .prologue
    .line 95
    sget-object v0, Lbutterknife/ButterKnife$Finder;->$VALUES:[Lbutterknife/ButterKnife$Finder;

    invoke-virtual {v0}, [Lbutterknife/ButterKnife$Finder;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lbutterknife/ButterKnife$Finder;

    return-object v0
.end method


# virtual methods
.method public abstract findOptionalView(Ljava/lang/Object;I)Landroid/view/View;
.end method

.method public findRequiredView(Ljava/lang/Object;ILjava/lang/String;)Landroid/view/View;
    .registers 9
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "id"    # I
    .param p3, "who"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-virtual {p0, p1, p2}, Lbutterknife/ButterKnife$Finder;->findOptionalView(Ljava/lang/Object;I)Landroid/view/View;

    move-result-object v1

    .line 135
    .local v1, "view":Landroid/view/View;
    if-nez v1, :cond_45

    .line 136
    invoke-virtual {p0, p1}, Lbutterknife/ButterKnife$Finder;->getContext(Ljava/lang/Object;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "name":Ljava/lang/String;
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Required view \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' with ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was not found. If this view is optional add \'@Optional\' annotation."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 145
    .end local v0    # "name":Ljava/lang/String;
    :cond_45
    return-object v1
.end method

.method protected abstract getContext(Ljava/lang/Object;)Landroid/content/Context;
.end method
