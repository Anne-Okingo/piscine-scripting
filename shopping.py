def remember_the_apple(shopping_list):
    # If the list is empty, return it as is
    if not shopping_list:
        return shopping_list

    # Add 'apple' only if it's missing
    if 'apple' not in shopping_list:
        shopping_list.append('apple')

    return shopping_list
