<?php

declare(strict_types=1);

function isPalindrome(string $text): bool
{
    $text = mb_strtolower($text, 'UTF-8');
    $text = preg_replace('/[^\p{L}\p{N}]/u', '', $text);

    if ($text === null) {
        return false;
    }

    $characters = preg_split('//u', $text, -1, PREG_SPLIT_NO_EMPTY);

    if ($characters === false) {
        return false;
    }

    for ($left = 0, $right = count($characters) - 1; $left < $right; $left++, $right--) {
        if ($characters[$left] !== $characters[$right]) {
            return false;
        }
    }

    return true;
}