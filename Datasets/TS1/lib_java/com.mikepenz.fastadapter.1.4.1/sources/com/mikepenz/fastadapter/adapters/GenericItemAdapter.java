package com.mikepenz.fastadapter.adapters;

import com.mikepenz.fastadapter.items.GenericAbstractItem;
import com.mikepenz.fastadapter.utils.Function;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/GenericItemAdapter.class */
public class GenericItemAdapter<Model, Item extends GenericAbstractItem<Model, Item, ?>> extends ItemAdapter<Item> {
    private final Function<Model, Item> mItemFactory;

    public GenericItemAdapter(Class<? extends Item> itemClass, Class<? extends Model> modelClass) {
        this(new ReflectionBasedItemFactory(modelClass, itemClass));
    }

    public GenericItemAdapter(Function<Model, Item> itemFactory) {
        this.mItemFactory = itemFactory;
    }

    public List<Model> getModels() {
        ArrayList arrayList = new ArrayList();
        for (Item item : getAdapterItems()) {
            arrayList.add(item.getModel());
        }
        return arrayList;
    }

    public GenericItemAdapter<Model, Item> setModel(List<Model> models) {
        super.set((List) toItems(models));
        return this;
    }

    public GenericItemAdapter<Model, Item> setNewModel(List<Model> models) {
        super.setNewList((List) toItems(models));
        return this;
    }

    @SafeVarargs
    public final GenericItemAdapter<Model, Item> addModel(Model... models) {
        addModel(Arrays.asList(models));
        return this;
    }

    public GenericItemAdapter<Model, Item> addModel(List<Model> models) {
        super.add((List) toItems(models));
        return this;
    }

    @SafeVarargs
    public final GenericItemAdapter<Model, Item> addModel(int position, Model... models) {
        addModel(position, Arrays.asList(models));
        return this;
    }

    public GenericItemAdapter<Model, Item> addModel(int position, List<Model> models) {
        super.add(position, (List) toItems(models));
        return this;
    }

    public GenericItemAdapter<Model, Item> setModel(int position, Model model) {
        super.set(position, (int) toItem(model));
        return this;
    }

    public GenericItemAdapter<Model, Item> clearModel() {
        super.clear();
        return this;
    }

    public GenericItemAdapter<Model, Item> moveModel(int fromPosition, int toPosition) {
        super.move(fromPosition, toPosition);
        return this;
    }

    public GenericItemAdapter<Model, Item> removeModelRange(int position, int itemCount) {
        super.removeRange(position, itemCount);
        return this;
    }

    public GenericItemAdapter<Model, Item> removeModel(int position) {
        super.remove(position);
        return this;
    }

    protected List<Item> toItems(List<Model> models) {
        if (models == null) {
            return Collections.emptyList();
        }
        ArrayList arrayList = new ArrayList(models.size());
        for (Model model : models) {
            arrayList.add(toItem(model));
        }
        return arrayList;
    }

    protected Item toItem(Model model) {
        return this.mItemFactory.apply(model);
    }

    /* loaded from: com.mikepenz.fastadapter.1.4.1.jar:com/mikepenz/fastadapter/adapters/GenericItemAdapter$ReflectionBasedItemFactory.class */
    protected static class ReflectionBasedItemFactory<Model, Item> implements Function<Model, Item> {
        private final Class<? extends Model> modelClass;
        private final Class<? extends Item> itemClass;

        public ReflectionBasedItemFactory(Class<? extends Model> modelClass, Class<? extends Item> itemClass) {
            this.modelClass = modelClass;
            this.itemClass = itemClass;
        }

        @Override // com.mikepenz.fastadapter.utils.Function
        public Item apply(Model model) {
            try {
                Constructor<? extends Item> constructor = this.itemClass.getDeclaredConstructor(this.modelClass);
                constructor.setAccessible(true);
                return constructor.newInstance(model);
            } catch (Exception e) {
                throw new RuntimeException("Please provide a constructor that takes a model as an argument");
            }
        }
    }
}
