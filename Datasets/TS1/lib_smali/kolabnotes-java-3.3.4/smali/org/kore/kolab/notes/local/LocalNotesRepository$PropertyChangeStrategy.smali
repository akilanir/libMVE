.class abstract enum Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
.super Ljava/lang/Enum;
.source "LocalNotesRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/kore/kolab/notes/local/LocalNotesRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4408
    name = "PropertyChangeStrategy"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

.field public static final enum DELETE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

.field public static final enum DELETE_NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

.field public static final enum NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

.field public static final enum NOTHING:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

.field public static final enum UPDATE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 103
    new-instance v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$1;

    const-string v1, "NOTHING"

    invoke-direct {v0, v1, v2}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NOTHING:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 111
    new-instance v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$2;

    const-string v1, "DELETE_NEW"

    invoke-direct {v0, v1, v3}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE_NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 119
    new-instance v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$3;

    const-string v1, "DELETE"

    invoke-direct {v0, v1, v4}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 140
    new-instance v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$4;

    const-string v1, "NEW"

    invoke-direct {v0, v1, v5}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 157
    new-instance v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$5;

    const-string v1, "UPDATE"

    invoke-direct {v0, v1, v6}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->UPDATE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 101
    const/4 v0, 0x5

    new-array v0, v0, [Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    sget-object v1, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NOTHING:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    aput-object v1, v0, v2

    sget-object v1, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE_NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    aput-object v1, v0, v3

    sget-object v1, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    aput-object v1, v0, v4

    sget-object v1, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    aput-object v1, v0, v5

    sget-object v1, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->UPDATE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    aput-object v1, v0, v6

    sput-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->$VALUES:[Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

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
    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/kore/kolab/notes/local/LocalNotesRepository$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/kore/kolab/notes/local/LocalNotesRepository$1;

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static putEvent(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V
    .registers 4
    .param p0, "repo"    # Lorg/kore/kolab/notes/local/LocalNotesRepository;
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/kore/kolab/notes/event/EventListener$Type;

    .prologue
    .line 184
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->getEvent(Ljava/lang/String;)Lorg/kore/kolab/notes/event/EventListener$Type;

    move-result-object v0

    if-nez v0, :cond_9

    .line 185
    invoke-virtual {p0, p1, p2}, Lorg/kore/kolab/notes/local/LocalNotesRepository;->putEvent(Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;)V

    .line 187
    :cond_9
    return-void
.end method

.method static valueChanged(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p0, "oldValue"    # Ljava/lang/Object;
    .param p1, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x1

    .line 176
    if-nez p0, :cond_6

    if-eqz p1, :cond_6

    .line 180
    :cond_5
    :goto_5
    return v0

    :cond_6
    if-eqz p0, :cond_e

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_e
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    const-class v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    return-object v0
.end method

.method static valueOf(Lorg/kore/kolab/notes/event/EventListener$Type;Lorg/kore/kolab/notes/event/EventListener$Type;)Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
    .registers 3
    .param p0, "existingtype"    # Lorg/kore/kolab/notes/event/EventListener$Type;
    .param p1, "newChangeType"    # Lorg/kore/kolab/notes/event/EventListener$Type;

    .prologue
    .line 190
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    if-ne p0, v0, :cond_b

    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    if-ne p1, v0, :cond_b

    .line 191
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE_NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    .line 199
    :goto_a
    return-object v0

    .line 192
    :cond_b
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->DELETE:Lorg/kore/kolab/notes/event/EventListener$Type;

    if-ne p1, v0, :cond_12

    .line 193
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->DELETE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    goto :goto_a

    .line 194
    :cond_12
    sget-object v0, Lorg/kore/kolab/notes/event/EventListener$Type;->NEW:Lorg/kore/kolab/notes/event/EventListener$Type;

    if-ne p1, v0, :cond_19

    .line 195
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NEW:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    goto :goto_a

    .line 196
    :cond_19
    if-nez p0, :cond_1e

    .line 197
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->UPDATE:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    goto :goto_a

    .line 199
    :cond_1e
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->NOTHING:Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    goto :goto_a
.end method

.method public static values()[Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;
    .registers 1

    .prologue
    .line 101
    sget-object v0, Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->$VALUES:[Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    invoke-virtual {v0}, [Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/kore/kolab/notes/local/LocalNotesRepository$PropertyChangeStrategy;

    return-object v0
.end method


# virtual methods
.method abstract performChange(Lorg/kore/kolab/notes/local/LocalNotesRepository;Ljava/lang/String;Lorg/kore/kolab/notes/event/EventListener$Type;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
.end method
