.class public final Lcom/jaredrummler/android/processes/ProcessManager$ProcessComparator;
.super Ljava/lang/Object;
.source "ProcessManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jaredrummler/android/processes/ProcessManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ProcessComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/jaredrummler/android/processes/models/AndroidProcess;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 310
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/jaredrummler/android/processes/models/AndroidProcess;Lcom/jaredrummler/android/processes/models/AndroidProcess;)I
    .registers 5
    .param p1, "p1"    # Lcom/jaredrummler/android/processes/models/AndroidProcess;
    .param p2, "p2"    # Lcom/jaredrummler/android/processes/models/AndroidProcess;

    .prologue
    .line 313
    iget-object v0, p1, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    iget-object v1, p2, Lcom/jaredrummler/android/processes/models/AndroidProcess;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 310
    check-cast p1, Lcom/jaredrummler/android/processes/models/AndroidProcess;

    check-cast p2, Lcom/jaredrummler/android/processes/models/AndroidProcess;

    invoke-virtual {p0, p1, p2}, Lcom/jaredrummler/android/processes/ProcessManager$ProcessComparator;->compare(Lcom/jaredrummler/android/processes/models/AndroidProcess;Lcom/jaredrummler/android/processes/models/AndroidProcess;)I

    move-result v0

    return v0
.end method
