<?php

declare(strict_types=1);

use PHPUnit\Framework\Attributes\DataProvider;
use PHPUnit\Framework\TestCase;

final class PalindromeTest extends TestCase
{
    #[DataProvider('palindromeProvider')]
    public function testPalindrome(string $input, bool $expected): void
    {
        self::assertSame($expected, isPalindrome($input));
    }

    public static function palindromeProvider(): array
    {
        return [
            ['racecar', true],
            ['RaceCar', true],
            ['hello', false],
            ['abba', true],
            ['abc', false],

            ['A man, a plan, a canal: Panama', true],
            ['А роза упала на лапу Азора', true],
            ['топот', true],
            ['шалаш', true],

            ['', true],
            ['a', true],
            ['12321', true],
            ['12345', false],
            ['!!!', true],
            ['   ', true],
            ['12 21', true],
        ];
    }
}
